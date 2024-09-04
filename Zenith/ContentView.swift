//
//  ContentView.swift
//  Zenith
//
//  Created by 李伟 on 2024/8/31.
//

import SwiftUI
import SwiftData

enum ProgrammingTopic: String {
    case swift = "Swift"
    case swiftUI = "SwiftUI"

    var details: String {
        switch self {
        case .swift:
            return """
            Swift 是一种功能强大且直观的编程语言，用于开发 iOS、macOS、watchOS 和 tvOS 的应用程序。...
            """
        case .swiftUI:
            return """
            SwiftUI 是一种声明式框架，用于构建 iOS 和 macOS 的用户界面。...
            """
        }
    }
}

struct ContentView: View {
    var body: some View {
        ViewControllerWrapper()
    }
}
struct ViewControllerWrapper: NSViewControllerRepresentable {
    func makeNSViewController(context: Context) -> EditorController {
        return EditorController()
    }

    func updateNSViewController(_ nsViewController: EditorController, context: Context) {
        // 如果有需要更新的内容可以在这里处理
    }

}
struct DraggableView: View {
    @State private var offset: CGSize = .zero

    var body: some View {
        Text("拖拽我")
            .padding()
            .background(Color.blue)
            .cornerRadius(8)
            .foregroundColor(.white)
            .offset(offset)
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        offset = gesture.translation
                    }
                    .onEnded { _ in
                        // 如果你想让视图在拖拽结束后回到原位，可以在这里将 offset 重置为 .zero
                        // offset = .zero
                    }
            )
    }
}

struct DetailView: View {
    var item: ProgrammingTopic?

    var body: some View {
        if let item = item {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Detail view for \(item.rawValue)")
                        .font(.largeTitle)
                        .bold()

                    Text(item.details)
                        .font(.body)
                }
                .padding()
            }
            .navigationTitle(item.rawValue)
        } else {
            Text("No item selected")
                .navigationTitle("Detail")
        }
    }
}

struct DemoView: View {
    var body: some View {
        NavigationStack {
            VStack {
                let editorController = EditorController()
            }
        }
    }
}
struct SidebarView: View {
    var body: some View {
        List {
            Section {
                NavigationLink(destination: DemoView()) {
                    Text("swift")
                }
                NavigationLink(destination: DetailView(item: .swiftUI)) {
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
}
