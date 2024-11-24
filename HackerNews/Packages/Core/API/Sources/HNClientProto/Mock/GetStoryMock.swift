//
//  HNClientMock.swift
//  API
//
//  Created by Joe Diragi on 11/24/24.
//

import HNClientProto

public extension GetStory {
    static func mockRequest() -> GetStory {
        GetStory(storyID: HNMocks.id())
    }
    
    static func mockResponse() -> HNResponse {
        HNResponse(
            id: HNMocks.id(),
            author: HNMocks.author(),
            time: HNMocks.time(),
            title: HNMocks.title()
        )
    }
}
