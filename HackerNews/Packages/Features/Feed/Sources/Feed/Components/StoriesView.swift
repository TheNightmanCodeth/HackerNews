//
//  StoriesView.swift
//  Feed
//
//  Created by Joe Diragi on 11/24/24.
//

import SwiftUI
import NetworkingProto
import HNClientProto

struct StoriesView: View {
    let client: HNClientProto
    @State var viewModel: StoriesViewModel
    
    init(client: HNClientProto) {
        self.client = client
        self.viewModel = .init()
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                ForEach(viewModel.storyIDs, id: \.self) { storyID in
                    StoryListItem(storyID: storyID, fetchTask: Task {
                        return try await client.fetchStory(storyID)
                    })
                }
            }
        }.task(getStoryIDs)
    }
    
    @Sendable
    func getStoryIDs() async {
        self.viewModel.storyIDs = (try? await client.fetchStoryIDs(.best)) ?? []
    }
}

struct StoryListItem: View {
    let storyID: Int
    @State var story: Story? = nil
    
    var fetchTask: Task<Story, Error>
    
    init(storyID: Int, fetchTask: Task<Story, Error>) {
        self.storyID = storyID
        self.fetchTask = fetchTask
    }
    
    var body: some View {
        if let story {
            VStack {
                header(story)
                
                
            }.padding()
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 2))
        } else {
            ProgressView()
                .progressViewStyle(.circular)
                .task {
                    story = try? await fetchTask.value
                }
        }
    }
    
    @ViewBuilder
    func header(_ story: Story) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack {
                Text(story.title)
                Spacer()
            }
            
            HStack {
                Text(story.author)
                Spacer()
            }
        }
    }
}


@Observable
final class StoriesViewModel {
    var storyIDs: [Int] = []
    
    init() { }
}

#if targetEnvironment(simulator)
import HNClient
import NetworkingMock


#Preview {
    StoriesView(client: HNClient(client: MockNetworkingClient()))
}
#endif
