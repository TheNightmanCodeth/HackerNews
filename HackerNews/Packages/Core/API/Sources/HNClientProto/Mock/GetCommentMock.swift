//
//  GetCommentMock.swift
//  API
//
//  Created by Joe Diragi on 11/24/24.
//

import HNClientProto

public extension GetComment {
    static func mockRequest() -> GetComment {
        GetComment(commentID: HNMocks.id())
    }
    
    static func mockResponse() -> HNResponse {
        HNResponse(
            id: HNMocks.id(),
            author: HNMocks.author(),
            time: HNMocks.time(),
            text: HNMocks.title(),
            parent: HNMocks.id()
        )
    }
}
