//
//  FileManager.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/3/25.
//

import Foundation

//extension FileManager {
//    static func loadGeneFile(named fileName: String) -> Gene? {
//        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//        let genesDirectory = documentsDirectory.appendingPathComponent("genes")
//        let filePath = genesDirectory.appendingPathComponent(fileName)
//        
//        do {
//            let data = try Data(contentsOf: filePath)
//            let gene = try JSONDecoder().decode(Gene.self, from: data)
//            return gene
//        } catch {
//            print("Error loading file: \(error.localizedDescription)")
//            return nil
//        }
//    }
//}

extension FileManager {
    static func loadGeneFiles() -> [GeneFile] {
        // Get the documents directory
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let genesDirectory = documentsDirectory.appendingPathComponent("genes")

        do {
            // Use FileManager.default to access instance methods
            let fileURLs = try FileManager.default.contentsOfDirectory(at: genesDirectory, includingPropertiesForKeys: [.fileSizeKey, .contentModificationDateKey], options: .skipsHiddenFiles)

            // Filter JSON files and map to GeneFile objects
            return fileURLs.filter { $0.pathExtension == "json" }.compactMap { url in
                // Get file attributes
                let attributes = try? FileManager.default.attributesOfItem(atPath: url.path)
                let fileSize = attributes?[.size] as? Int64 ?? 0
                let modificationDate = attributes?[.modificationDate] as? Date ?? Date()

                // Format file size
                let formattedSize = ByteCountFormatter.string(fromByteCount: fileSize, countStyle: .file)

                // Format modification date
                let dateFormatter = DateFormatter()
                dateFormatter.dateStyle = .medium
                dateFormatter.timeStyle = .none
                let formattedDate = dateFormatter.string(from: modificationDate)

                // Create GeneFile object
                return GeneFile(
                    name: url.lastPathComponent,
                    size: formattedSize,
                    lastModified: formattedDate,
                    isCompleted: Bool.random() // Randomly assign completion status for demonstration
                )
            }
        } catch {
            print("Error loading gene files: \(error.localizedDescription)")
            return []
        }
    }
}

//
//struct GeneFile: Identifiable {
//    let id = UUID()
//    let name: String // 文件名
//    let size: String // 文件大小
//    let lastModified: String // 最后修改时间
//    let isCompleted: Bool // 是否已完成
//}
