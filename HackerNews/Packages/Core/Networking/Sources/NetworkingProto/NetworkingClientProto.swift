//
//  NetworkingProto.swift
//  Networking
//
//  Created by Joe Diragi on 11/24/24.
//

import Foundation

public typealias NetworkResponse = (data: Data, statusCode: Int)

public protocol NetworkingClient: Sendable {
    
    /// Accepts a `Request` and decodes the response as `type` using the given `JSONDecoder`
    ///
    /// - Parameter request: Used to generate a `URLRequest` via ``Request/build()``
    /// - Parameter type: The type to decode the response as
    /// - Parameter decoder: The `JSONDecoder` used to decode the response
    /// - Returns: The decoded response data
    func request<R: Request>(_ request: R, decoder: JSONDecoder) async throws(
        NetworkingError
    ) -> R.Res
    
    /// Accepts a `Request` and uses the given ``Mappable/map(_:)`` function to convert the response
    ///
    /// The response is first decoded to the given ``Mappable/Input`` using the default `JSONDecoder`.
    /// Then, the result of the given ``Mappable/map(_:)`` is returned, as ``Mappable/Output``
    ///
    /// - Parameter request: Used to generate a `URLRequest` via ``Request/build()``
    /// - Parameter mapper: Used to ``Mappable/map(_:)`` the response, given decoded as ``Mappable/Input``
    /// - Returns: The mapped result, as ``Mappable/Output``
    func request<R: Request, M: Mappable>(_ request: R, mapper: M) async throws(
        NetworkingError
    ) -> M.Output where M.Input == R.Res
    
    /// Accepts a `Request` and returns a ``Result`` containing either a ``NetworkResponse`` or ``NetworkingError``
    ///
    /// - Parameter request: Used to generate a `URLRequest` via ``Request/build()``
    /// - Returns: A ``Result`` containing either a ``NetworkResponse`` or ``NetworkingError``
    func send<R: Request>(_ request: R) async -> Result<NetworkResponse, NetworkingError>
}
