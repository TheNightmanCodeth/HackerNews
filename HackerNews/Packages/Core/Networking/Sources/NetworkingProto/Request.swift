//
//  Request.swift
//  Networking
//
//  Created by Joe Diragi on 11/24/24.
//

import Foundation

public protocol NetworkMockable: Codable {
    associatedtype Req: Codable
    associatedtype Res: Codable
    
    static func mockRequest() -> Req
    static func mockResponse() -> Res
}

public protocol Request: NetworkMockable {    
    /// Builds a `URLRequest` for the network manager
    func build() throws(NetworkingError) -> URLRequest
}

