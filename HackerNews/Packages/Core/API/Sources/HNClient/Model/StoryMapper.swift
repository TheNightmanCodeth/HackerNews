//
//  StoryMapper.swift
//  API
//
//  Created by Joe Diragi on 11/24/24.
//

import Foundation
import NetworkingProto
import HNClientProto

struct StoryMapper: Mappable {
    func map(_ input: HNResponse) throws -> Story {
        guard let id = input.id, let author = input.author,
              let time = input.time, let title = input.title else {
            throw NetworkingError.invalidRequest
        }
        
        return Story(
            id: id,
            author: author,
            descendants: input.descendants ?? 0,
            replyIDs: input.kids ?? [],
            score: input.score ?? 0,
            time: Date(timeIntervalSinceReferenceDate: TimeInterval(time)),
            title: title,
            url: input.url,
            text: input.text
        )
    }
}
