//
//  Story.swift
//  API
//
//  Created by Joe Diragi on 11/24/24.
//

import Foundation

public struct Story: Codable, Identifiable, Sendable {
    public let id: Int
    public let author: String
    public let descendants: Int
    public let replyIDs: [Int]
    public let score: Int
    public let time: Date
    public let title: String
    public let url: URL?
    public let text: String?
    
    public init(
        id: Int,
        author: String,
        descendants: Int,
        replyIDs: [Int],
        score: Int,
        time: Date,
        title: String,
        url: URL?,
        text: String?
    ) {
        self.id = id
        self.author = author
        self.descendants = descendants
        self.replyIDs = replyIDs
        self.score = score
        self.time = time
        self.title = title
        self.url = url
        self.text = text
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case author = "by"
        case descendants = "descendants"
        case replyIDs = "kids"
        case score = "score"
        case title = "title"
        case url = "url"
        case text = "text"
        case time = "time"
    }
}
