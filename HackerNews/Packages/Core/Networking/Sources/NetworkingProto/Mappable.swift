//
//  Mappable.swift
//  Networking
//
//  Created by Joe Diragi on 11/24/24.
//

public protocol Mappable {
    
    /// Some ``Decodable`` type, created from a network response, to be mapped to ``Output``
    associatedtype Input: Decodable
    
    /// Some model type created from ``Input``
    associatedtype Output
    
    /// Maps the given input to ``Output``
    func map(_ input: Input) throws -> Output
}
