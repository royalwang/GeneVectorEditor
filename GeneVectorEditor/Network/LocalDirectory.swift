//
//  zz.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/3/25.
//

import Foundation

func fetchJsonFilesFromLocalDirectory() {
    // 获取应用沙盒的 Documents 目录路径
    let fileManager = FileManager.default
    if let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
        // 拼接 genes 目录路径
        let genesDirectoryURL = documentsDirectory.appendingPathComponent("genes")
        
        do {
            // 获取 genes 目录下的所有文件 URL
            let fileURLs = try fileManager.contentsOfDirectory(at: genesDirectoryURL, includingPropertiesForKeys: nil)
            
            // 遍历文件 URL，筛选出 .json 文件
            for fileURL in fileURLs {
                if fileURL.pathExtension == "json" {
                    print("找到文件：\(fileURL.lastPathComponent)")
                }
            }
        } catch {
            print("读取目录失败: \(error.localizedDescription)")
        }
    } else {
        print("无法找到 Documents 目录")
    }
}

// 调用函数查找文件
//fetchJsonFilesFromLocalDirectory()
