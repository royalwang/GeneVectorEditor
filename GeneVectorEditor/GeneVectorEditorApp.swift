//
//  GeneVectorEditorApp.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 2024/6/4.
//

import SwiftUI

@main
struct GeneSequenceViewerApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    init() {
        // 调用函数获取 Documents 目录路径
        if let documentsPath = getDocumentsDirectory() {
            print("应用沙盒的 Documents 路径是: \(documentsPath)")
        }
    }
}
