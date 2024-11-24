//
//  GetStoriesMock.swift
//  API
//
//  Created by Joe Diragi on 11/24/24.
//

import HNClientProto

public extension GetStories {
    static func mockRequest() -> GetStories {
        GetStories(sort: .best)
    }
    
    static func mockResponse() -> [Int] {
        func mock() -> Int { HNMocks.id() }
        return [Int](1...30).map { _ in mock() }
    }
}
