//
//  FileUploadView.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/5/25.
//


import SwiftUI
import UniformTypeIdentifiers

struct FileUploadView: View {
    @State private var dragOver = false
    @State private var uploadedFiles: [URL] = []
    
    var body: some View {
        VStack(spacing: 20) {
            // 文件拖拽区域
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
                openFilePicker()
            }) {
                HStack {
                    Image(systemName: "plus")
                        .font(.headline)
                    Text("Add Gene File")
                        .font(.headline)
                }
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
            }
            
            // 已上传文件列表
            if !uploadedFiles.isEmpty {
                List(uploadedFiles, id: \.self) { file in
                    Text(file.lastPathComponent)
                }
            }
        }
        .padding()
    }
    
    // 处理文件拖拽
    private func handleFileDrop(providers: [NSItemProvider]) -> Bool {
        for provider in providers {
            if provider.hasItemConformingToTypeIdentifier(UTType.fileURL.identifier) {
                provider.loadItem(forTypeIdentifier: UTType.fileURL.identifier, options: nil) { (item, error) in
                    if let error = error {
                        print("Error loading file: \(error)")
                        return
                    }
                    
                    if let url = item as? URL {
                        DispatchQueue.main.async {
                            self.addFile(url: url)
                        }
                    }
                }
            }
        }
        return true
    }
    
    // 打开文件选择器
    private func openFilePicker() {
#if canImport(AppKit)
        let panel = NSOpenPanel()
        panel.canChooseFiles = true
        panel.canChooseDirectories = false
        panel.allowsMultipleSelection = true
        panel.allowedContentTypes = [.json] // 允许的文件类型
        
        if panel.runModal() == .OK {
            for url in panel.urls {
                self.addFile(url: url)
            }
        }
#else
        print("NSOpenPanel is not supported on this platform.")
#endif
    }
    
    // 添加文件到上传列表
    private func addFile(url: URL) {
        if !uploadedFiles.contains(url) {
            uploadedFiles.append(url)
        } else {
            print("File already exists: \(url.lastPathComponent)")
        }
    }
}

struct FileUploadView_Previews: PreviewProvider {
    static var previews: some View {
        FileUploadView()
    }
}
