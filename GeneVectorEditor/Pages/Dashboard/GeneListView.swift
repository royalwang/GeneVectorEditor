//
//  GeneListView.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/4/25.
//

import SwiftUI

struct GeneListView: View {
    @State private var geneFiles: [GeneFile] = []

    var body: some View {
        List {
            ForEach(geneFiles) { file in
                NavigationLink(destination: FileDetailPage3(fileName: file.name)) {
                    GeneFileRow2(file: file)
                }
            }
        }
        .onAppear {
            self.geneFiles = FileManager.loadGeneFiles()
        }
    }
    
    // 删除基因文件
    private func deleteGeneFile(fileName: String) {
        GeneFileManager.shared.deleteGeneFile(fileName: fileName)
        loadGeneFiles() // 重新加载文件列表
    }
    
    // 加载基因文件列表
    private func loadGeneFiles() {
        let files = GeneFileManager.shared.listGeneFiles()
        geneFiles = files.map { fileName in
            let filePath = GeneFileManager.shared.genesDirectory.appendingPathComponent(fileName)
            let attributes = try? FileManager.default.attributesOfItem(atPath: filePath.path)

            // 获取文件大小和修改时间
            let fileSize = attributes?[.size] as? Int64 ?? 0
            let formattedSize = ByteCountFormatter.string(fromByteCount: fileSize, countStyle: .file)

            let modificationDate = attributes?[.modificationDate] as? Date ?? Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            let formattedDate = dateFormatter.string(from: modificationDate)

            return GeneFile(
                name: fileName,
                size: formattedSize,
                lastModified: formattedDate,
                isCompleted: true // 假设文件已完成（示例）
            )
        }
    }
    
}

// 每一行的视图
struct GeneFileRow2: View {
    let file: GeneFile

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(file.name)
                    .font(.headline)
                    .foregroundColor(.black)
                Text("\(file.size) • Last modified: \(file.lastModified)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()

            if file.isCompleted {
                Button(action: {
                    // 下载或查看文件的操作
                }) {
                    Text("Download")
                        .foregroundColor(.white)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 15)
                        .background(Color.green)
                        .cornerRadius(8)
                }
            } else {
                Button(action: {
                    // 查看或处理文件的操作
                }) {
                    Text("View")
                        .foregroundColor(.white)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 15)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}
