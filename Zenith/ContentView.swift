//
//  ContentView.swift
//  Zenith
//
//  Created by 李伟 on 2024/8/31.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
            NavigationSplitView {
                SidebarView()
            }detail: {
                DetailView()
            }
        }

}
struct DetailView: View {
    var item: String?

    var body: some View {
        if let item = item {
            NavigationStack {
                NavigationLink {
                    Text("asd")
                } label: {
                    VStack {
                        Text("Detail view for \(item)")
                            .font(.largeTitle)
                            .bold()
                        Text("demo")
                            .font(.title2)
                    }
                    .background(in: RoundedRectangle(cornerRadius: 15))
                }
            }
                .navigationTitle(item)
        } else {
            Text("No item selected")
                .navigationTitle("Detail")
        }
    }
}

struct SidebarView: View {
    var body: some View {
        List {
            Section {
                NavigationLink(destination: DetailView(item: "Item 1")) {
                    Text("swift")
                }
                NavigationLink(destination: DetailView(item: "Item 2")) {
                    Text("SwiftUI")
                }
            } header: {
                Text("Programming")
            }
        }
        .navigationTitle("Sidebar")
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
