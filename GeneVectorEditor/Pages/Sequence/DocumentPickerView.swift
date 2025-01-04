//
//  DocumentPickerView.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/5/25.
//


import SwiftUI
import UniformTypeIdentifiers

// DocumentPickerView 用于包装 UIDocumentPickerViewController
struct DocumentPickerView: UIViewControllerRepresentable {
    let onPickedFiles: ([URL]) -> Void // 文件选择后的回调

    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        // 配置 UIDocumentPickerViewController，仅允许选择 JSON 文件
        let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: [.json], asCopy: true)
        documentPicker.delegate = context.coordinator
        return documentPicker
    }

    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(onPickedFiles: onPickedFiles)
    }

    // Coordinator 处理 DocumentPicker 的回调
    class Coordinator: NSObject, UIDocumentPickerDelegate {
        let onPickedFiles: ([URL]) -> Void

        init(onPickedFiles: @escaping ([URL]) -> Void) {
            self.onPickedFiles = onPickedFiles
        }

        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            onPickedFiles(urls) // 返回选中的文件路径
        }

        func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
            print("Document picker was cancelled")
        }
    }
}
