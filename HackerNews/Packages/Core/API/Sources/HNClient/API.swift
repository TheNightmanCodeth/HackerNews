// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import NetworkingProto
import HNClientProto

import OSLog

public struct HNClient: HNClientProto {
    let client: NetworkingClient
    
    private let logger: Logger = .init(subsystem: "API", category: "HNClient")
    
    public init(client: NetworkingClient) {
        self.client = client
    }
    
    public func fetchStoryIDs(_ sort: StoriesSort) async throws(NetworkingError) -> [Int] {
        do {
            return try await client.request(GetStories(sort: sort), decoder: JSONDecoder())
        } catch {
            throw error
        }
    }
    
    public func fetchStory(_ id: Int) async throws(NetworkingError) -> Story {
        do {
            return try await client.request(GetStory(storyID: id), mapper: StoryMapper())
        } catch {
            logger.error("\(error)")
            throw error
        }
    }
    
    public func fetchComment(_ id: Int) async throws(NetworkingError) -> Comment {
        return try await client.request(GetComment(commentID: id), mapper: CommentMapper())
    }
}
