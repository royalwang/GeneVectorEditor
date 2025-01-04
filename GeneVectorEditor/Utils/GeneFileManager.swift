//
//  GeneFileManager.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/4/25.
//


import Foundation

struct GeneFileManager {
    static let shared = GeneFileManager()

    // 获取沙盒文档目录中的 genes 文件夹路径
    var genesDirectory: URL {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent("genes")
    }

    // 创建 genes 目录（如果不存在）
    func createGenesDirectory() {
        do {
            if !FileManager.default.fileExists(atPath: genesDirectory.path) {
                try FileManager.default.createDirectory(at: genesDirectory, withIntermediateDirectories: true, attributes: nil)
                print("Genes directory created at \(genesDirectory.path)")
            } else {
                print("Genes directory already exists.")
            }
        } catch {
            print("Error creating genes directory: \(error)")
        }
    }

    // 添加基因序列文件
    func addGeneFile(fileName: String, sequence: String) {
        createGenesDirectory() // 确保目录已创建

        let fileURL = genesDirectory.appendingPathComponent(fileName)
        do {
            try sequence.write(to: fileURL, atomically: true, encoding: .utf8)
            print("Gene file \(fileName) added successfully at \(fileURL.path)")
        } catch {
            print("Error writing gene file: \(error)")
        }
    }
    
    // 更新基因序列文件（如果存在）
    func updateGeneFile(fileName: String, newSequence: String) {
        let fileURL = genesDirectory.appendingPathComponent(fileName)

        if FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                try newSequence.write(to: fileURL, atomically: true, encoding: .utf8)
                print("Gene file \(fileName) updated successfully at \(fileURL.path)")
            } catch {
                print("Error updating gene file: \(error)")
            }
        } else {
            print("Gene file \(fileName) does not exist. Cannot update.")
        }
    }

    // 删除基因序列文件
    func deleteGeneFile(fileName: String) {
        let fileURL = genesDirectory.appendingPathComponent(fileName)
        do {
            if FileManager.default.fileExists(atPath: fileURL.path) {
                try FileManager.default.removeItem(at: fileURL)
                print("Gene file \(fileName) deleted successfully.")
            } else {
                print("File \(fileName) does not exist.")
            }
        } catch {
            print("Error deleting file: \(error)")
        }
    }

    // 列出 genes 目录中的所有文件
    func listGeneFiles() -> [String] {
        do {
            let files = try FileManager.default.contentsOfDirectory(atPath: genesDirectory.path)
            return files
        } catch {
            print("Error listing gene files: \(error)")
            return []
        }
    }
    
    // 读取基因序列文件内容
    func readGeneFile(fileName: String) -> String? {
        let fileURL = genesDirectory.appendingPathComponent(fileName)
        do {
            let content = try String(contentsOf: fileURL, encoding: .utf8)
            return content
        } catch {
            print("Error reading file: \(error)")
            return nil
        }
    }
    
}
