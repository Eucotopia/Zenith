//
//  ViewController.swift
//  Zenith
//
//  Created by 李伟 on 2024/9/5.
//

import SwiftUI
import Cocoa

// NSTextView 绘制文本并作为用户与文本交互的视图
final class EditorController: NSViewController, NSTextContentManagerDelegate, NSTextContentStorageDelegate {
    // 管理文本布局
    var textLayoutManager: NSTextLayoutManager
    var textContentStorage: NSTextContentStorage
    // 显示和编辑文本
    var textView: NSTextView!

    required init?(coder: NSCoder) {
        // 创建一个 NSTextLayoutManager 实例
        textLayoutManager = NSTextLayoutManager()
        // 创建一个 NSTextContentStorage 实例
        textContentStorage = NSTextContentStorage()
        super.init(coder: coder)
        textContentStorage.delegate = self
        // 将 NSTextLayoutManager 添加到 NSTextContentStorage
        textContentStorage.addTextLayoutManager(textLayoutManager)
        // 创建一个 NSTextContainer 实例
        let textContainer = NSTextContainer(size: NSSize(width: 200, height: 0))
        // 将 NSTextContainer 关联到 NSTextLayoutManager
        textLayoutManager.textContainer = textContainer
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // 创建一个 NSTextView 实例
        textView = NSTextView(
            frame: view.bounds,
            textContainer: textLayoutManager.textContainer
        )

        // 自动调整大小以适应父视图
        textView.autoresizingMask = [.width, .height]

        // 创建一个可滚动的文本视图
        let scrollView = NSTextView.scrollableTextView()

        // 禁用自动转换约束掩码，以便使用 Auto Layout
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        // 设置 textView 为 scrollView 的 documentView
        scrollView.documentView = textView

        // 将 scrollView 添加到当前视图中
        view.addSubview(scrollView)

        // 设置 Auto Layout 约束
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
