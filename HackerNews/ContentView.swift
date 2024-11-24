//
//  ContentView.swift
//  HackerNews
//
//  Created by Joe Diragi on 11/24/24.
//

import SwiftUI
import SwiftData
import Feed
import HNClient
import NetworkingClient

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        FeedCoordinator(
            dependencies: .init(
                apiClient: HNClient(
                    client: DefaultNetworkingClient()
                )
            )
        )
    }

    private func addItem() {
        withAnimation {
            //let newItem = Item(timestamp: Date())
            //modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
//            for index in offsets {
//                modelContext.delete(items[index])
//            }
        }
    }
}

#Preview {
    ContentView()
        //.modelContainer(for: Item.self, inMemory: true)
}
