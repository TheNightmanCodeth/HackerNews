//
//  NetworkingError.swift
//  Networking
//
//  Created by Joe Diragi on 11/24/24.
//


public enum NetworkingError: Error {
    /// The request was invalid
    case invalidRequest
    
    /// The server rejected our request and may or may not have provided a reason in the body
    case badServerResponse(body: [String: Sendable]?)
    
    /// There was a problem with the network
    case network(error: Error)
    
    /// The request or response could not be serialized
    case serialization(error: Error)
}