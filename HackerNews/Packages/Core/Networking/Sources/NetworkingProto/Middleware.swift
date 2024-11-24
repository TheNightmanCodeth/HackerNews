//
//  Middleware.swift
//  Networking
//
//  Created by Joe Diragi on 11/24/24.
//

import Foundation

public protocol Middleware: Sendable {
    @Sendable func handle(_ request: consuming URLRequest) async throws(NetworkingError) -> URLRequest
    @Sendable func handle(_ response: NetworkResponse)
    @Sendable func handle(_ error: NetworkingError)
}

public extension Middleware {
    func handle(_ request: consuming URLRequest) async throws(NetworkingError) -> URLRequest {
        request
    }
    func handle(_ response: NetworkResponse) { }
    func handle(_ error: NetworkingError) { }
}
