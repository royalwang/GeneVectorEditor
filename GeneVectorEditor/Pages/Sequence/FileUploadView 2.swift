//
//  FileUploadView 2.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/5/25.
//

import SwiftUI

struct FileUploadView2: View {
    @State private var uploadedFiles: [URL] = []
    @State private var isShowingDocumentPicker = false

    var body: some View {
        VStack {
            // 打开文件选择器的按钮
            Button(action: {
                isShowingDocumentPicker = true
            }) {
                Text("Add File")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .sheet(isPresented: $isShowingDocumentPicker) {
                DocumentPickerView { urls in
                    self.addFiles(urls: urls)
                }
            }

            // 显示上传的文件列表
            List(uploadedFiles, id: \.self) { file in
                Text(file.lastPathComponent)
            }
        }
        .padding()
    }

    private func addFiles(urls: [URL]) {
        uploadedFiles.append(contentsOf: urls)
    }
}
