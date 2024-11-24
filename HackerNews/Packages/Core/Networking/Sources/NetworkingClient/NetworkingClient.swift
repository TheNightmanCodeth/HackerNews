//
//  NetworkingMock.swift
//  Networking
//
//  Created by Joe Diragi on 11/24/24.
//

import Foundation
import NetworkingProto
import OSLog

public struct DefaultNetworkingClient: NetworkingClient {
    private let logger: Logger = .init(subsystem: "Networking", category: "Client")
    
    private let middleware: [Middleware]
    private let urlSession: URLSession
    
    public init(middleware: [Middleware] = [], urlSession: URLSession = .shared) {
        self.middleware = middleware
        self.urlSession = urlSession
    }
    
    public func request<R: Request>(
        _ request: R, decoder: JSONDecoder = JSONDecoder())
    async throws(NetworkingError) -> R.Res
    {
        do throws(NetworkingError) {
            let response = try await send(request).get()
            
            for m in middleware { Task.detached { m.handle(response) } }
            
            do {
                return try decoder.decode(R.Res.self, from: response.data)
            } catch {
                logger
                    .error(
                        "Couldn't decode data: \(String(data: response.data, encoding: .utf8) ?? "NIL")"
                    )
                throw .serialization(error: error)
            }
        } catch {
            for m in middleware { Task.detached { m.handle(error) } }
            logger.error("\(error)")
            throw error
        }
    }

    public func request<R: Request, M: Mappable>(
        _ request: R, mapper: M)
    async throws(NetworkingError) -> M.Output where M.Input == R.Res
    {
        do {
            let response = try await self.request(request)
            return try mapper.map(response)
        } catch {
            throw .serialization(error: error)
        }
    }

    public func send<R: Request>(_ request: R) async -> Result<NetworkResponse, NetworkingError> {
        var urlRequest: URLRequest
        do {
            urlRequest = try request.build()
        } catch {
            return .failure(error)
        }
        
        for m in middleware {
            do {
                urlRequest = try await m.handle(urlRequest)
            } catch {
                return .failure(.network(error: error))
            }
        }
        
        let response: NetworkResponse
        do {
            let (data, urlResponse) = try await urlSession.data(for: urlRequest)
            let statusCode = (urlResponse as! HTTPURLResponse).statusCode
            response = (data, statusCode)
        } catch {
            return .failure(.network(error: error))
        }
        
        return .success(response)
    }
}
