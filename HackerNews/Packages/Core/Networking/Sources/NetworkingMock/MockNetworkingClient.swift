//
//  MockNetworkingClient.swift
//  Networking
//
//  Created by Joe Diragi on 11/24/24.
//

import Foundation
import NetworkingProto

public struct MockNetworkingClient: NetworkingClient {
    public init() {}
    
    public func request<R: Request>(
        _ request: R, decoder: JSONDecoder = JSONDecoder())
    async throws(NetworkingError) -> R.Res {
        return R.mockResponse()
    }

    public func request<R: Request, M: Mappable>(
        _ request: R, mapper: M)
    async throws(NetworkingError) -> M.Output where M.Input == R.Res {
        do {
            return try mapper.map(R.mockResponse())
        } catch {
            throw .serialization(error: error)
        }
    }
    
    public func send<R: Request>(_ request: R) async -> Result<NetworkResponse, NetworkingError> {
        do {
            let data = try JSONEncoder().encode(R.mockResponse())
            return .success((data, 200))
        } catch {
            return .failure(.serialization(error: error))
        }
    }
}
