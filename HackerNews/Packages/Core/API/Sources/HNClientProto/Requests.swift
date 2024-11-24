//
//  Requests.swift
//  API
//
//  Created by Joe Diragi on 11/24/24.
//

import Foundation
import NetworkingProto

extension Request {
    public typealias Res = HNResponse
    
    func makeURL(_ id: Int) -> URL {
        makeURL("/item/\(id)")
    }
    
    func makeURL(_ path: String) -> URL {
        URL(string: "https://hacker-news.firebaseio.com/v0")!
            .appending(path: "\(path).json")
            .appending(queryItems: [.init(name: "print", value: "pretty")])
    }
}

public struct GetStory: Request {
    public typealias Req = GetStory
    
    let storyID: Int
    
    public init(storyID: Int) {
        self.storyID = storyID
    }

    public func build() throws(NetworkingError) -> URLRequest {
        var req = URLRequest(
            url: makeURL(storyID)
        )
        req.httpMethod = "GET"
        return req
    }
}

public struct GetComment: Request {
    public typealias Req = GetComment
    
    let commentID: Int
    
    public init(commentID: Int) {
        self.commentID = commentID
    }
    
    public func build() throws(NetworkingError) -> URLRequest {
        var req = URLRequest(
            url: makeURL(commentID)
        )
        req.httpMethod = "GET"
        return req
    }
}

public enum StoriesSort: String, Codable {
    case top = "topstories"
    case new = "newstories"
    case best = "beststories"
}

public struct GetStories: Request {
    public typealias Req = Self
    public typealias Res = [Int]
    
    let sort: StoriesSort
    
    public init(sort: StoriesSort) {
        self.sort = sort
    }
    
    public func build() throws(NetworkingError) -> URLRequest {
        var req = URLRequest(
            url: makeURL(sort.rawValue)
        )
        req.httpMethod = "GET"
        return req
    }
}
