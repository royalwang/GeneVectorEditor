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
                    GeneFileRow(file: file, onDelete: deleteGeneFile)
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
