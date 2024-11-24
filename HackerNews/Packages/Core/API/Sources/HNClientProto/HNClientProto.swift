//
//  HNClientProto.swift
//  API
//
//  Created by Joe Diragi on 11/24/24.
//

import Foundation
import NetworkingProto

public struct HNResponse: Codable {
    public let id: Int?
    public let deleted: Bool?
    public let type: String?
    public let author: String?
    public let time: Int?
    public let text: String?
    public let dead: Bool?
    public let parent: Int?
    public let poll: Int?
    public let kids: [Int]?
    public let url: URL?
    public let score: Int?
    public let title: String?
    public let partIDs: [Int]?
    public let descendants: Int?
    
    public init(
        id: Int? = nil,
        deleted: Bool? = nil,
        type: String? = nil,
        author: String? = nil,
        time: Int? = nil,
        text: String? = nil,
        dead: Bool? = nil,
        parent: Int? = nil,
        poll: Int? = nil,
        kids: [Int]? = nil,
        url: URL? = nil,
        score: Int? = nil,
        title: String? = nil,
        partIDs: [Int]? = nil,
        descendants: Int? = nil
    ) {
        self.id = id
        self.deleted = deleted
        self.type = type
        self.author = author
        self.time = time
        self.text = text
        self.dead = dead
        self.parent = parent
        self.poll = poll
        self.kids = kids
        self.url = url
        self.score = score
        self.title = title
        self.partIDs = partIDs
        self.descendants = descendants
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case deleted
        case type
        case author = "by"
        case time
        case text
        case dead
        case parent
        case poll
        case kids
        case url
        case score
        case title
        case partIDs
        case descendants
    }
}

public protocol HNClientProto: Sendable {
    init(client: NetworkingClient)
    func fetchStoryIDs(_ sort: StoriesSort) async throws(NetworkingError) -> [Int]
    func fetchStory(_ id: Int) async throws(NetworkingError) -> Story
    func fetchComment(_ id: Int) async throws(NetworkingError) -> Comment
}

extension URL {
    static let hackerNews: URL = URL(string: "https://hacker-news.firebaseio.com/v0")!
}

