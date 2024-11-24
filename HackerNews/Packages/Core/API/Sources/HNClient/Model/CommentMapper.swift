//
//  CommentMapper.swift
//  API
//
//  Created by Joe Diragi on 11/24/24.
//

import Foundation
import NetworkingProto
import HNClientProto

struct CommentMapper: Mappable {
    func map(_ input: HNResponse) throws -> Comment {
        guard let id = input.id, let author = input.author, let text = input.text,
              let time = input.time, let parentID = input.parent else {
            throw NetworkingError.invalidRequest
        }
        
        return Comment(
            id: id,
            author: author,
            replyIDs: input.kids ?? [],
            parentID: parentID,
            text: text,
            time: Date(timeIntervalSinceReferenceDate: TimeInterval(time))
        )
    }
}
