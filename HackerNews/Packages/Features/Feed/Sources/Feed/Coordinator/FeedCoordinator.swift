//
//  FeedCoordinator.swift
//  Feed
//
//  Created by Joe Diragi on 11/24/24.
//

import SwiftUI
import HNClientProto

public struct FeedCoordinator: View {
    private var dependencies: Dependencies
    
    public init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    public var body: some View {
        StoriesView(client: dependencies.hnClient)
    }
}

public extension FeedCoordinator {
    struct Dependencies {
        let hnClient: HNClientProto
        
        public init(apiClient: HNClientProto) {
            self.hnClient = apiClient
        }
    }
}
