//
//  GeneSequenceListView 2.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/4/25.
//
import SwiftUI
import UniformTypeIdentifiers

struct FileUploadView: View {
    @State private var uploadedFiles: [URL] = []
    @State private var isShowingDocumentPicker = false
    @State private var dragOver = false

    var body: some View {
        VStack(spacing: 20) {
            // 拖拽区域
            ZStack {
                Rectangle()
                    .fill(dragOver ? Color.blue.opacity(0.2) : Color.gray.opacity(0.1))
                    .frame(height: 150)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(dragOver ? Color.blue : Color.gray, lineWidth: 2)
                    )
                Text("Drag and drop files here to upload")
                    .foregroundColor(.gray)
            }
            .onDrop(of: [UTType.fileURL.identifier], isTargeted: $dragOver) { providers in
                handleFileDrop(providers: providers)
            }

            // 文件添加按钮
            Button(action: {
                isShowingDocumentPicker = true
            }) {
                HStack {
                    Image(systemName: "plus")
                        .font(.headline)
                    Text("Add File")
                        .font(.headline)
                }
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
            }
            .sheet(isPresented: $isShowingDocumentPicker) {
                DocumentPickerView { urls in
                    self.addFiles(urls: urls)
                }
            }

            // 文件列表
            if !uploadedFiles.isEmpty {
                List(uploadedFiles, id: \.self) { file in
                    Text(file.lastPathComponent)
                }
            }
        }
        .padding()
    }

    // 添加文件到列表
    private func addFiles(urls: [URL]) {
        for url in urls {
            if !uploadedFiles.contains(url) {
                uploadedFiles.append(url)
            }
        }
    }

    // 处理文件拖拽
    private func handleFileDrop(providers: [NSItemProvider]) -> Bool {
        for provider in providers {
            if provider.hasItemConformingToTypeIdentifier("public.file-url") {
                provider.loadItem(forTypeIdentifier: "public.file-url", options: nil) { (item, error) in
                    if let error = error {
                        print("Error loading file: \(error)")
                        return
                    }

                    if let url = item as? URL {
                        DispatchQueue.main.async {
                            self.addFiles(urls: [url])
                        }
                    }
                }
            }
        }
        return true
    }
}
