//
//  Comment.swift
//  API
//
//  Created by Joe Diragi on 11/24/24.
//

import Foundation

public struct Comment: Codable, Identifiable, Sendable {
    public let id: Int
    public let author: String
    public let replyIDs: [Int]
    public let parentID: Int
    public let text: String
    public let time: Date
    
    public init(id: Int, author: String, replyIDs: [Int], parentID: Int, text: String, time: Date) {
        self.id = id
        self.author = author
        self.replyIDs = replyIDs
        self.parentID = parentID
        self.text = text
        self.time = time
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case author = "by"
        case replyIDs = "kids"
        case parentID = "parent"
        case text = "text"
        case time = "time"
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.author = try container.decode(String.self, forKey: .author)
        self.replyIDs = try container.decode([Int].self, forKey: .replyIDs)
        self.parentID = try container.decode(Int.self, forKey: .parentID)
        self.text = try container.decode(String.self, forKey: .text)
        let time = try container.decode(Int.self, forKey: .time)
        self.time = Date(timeIntervalSinceReferenceDate: TimeInterval(time))
    }
}
