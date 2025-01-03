//
//  GeneService 2.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/3/25.
//

import Foundation

class GeneDirService {
    
    // 获取基因数据，接收目录名作为参数
    func fetchGeneData(from directoryName: String, completion: @escaping (Result<[Gene], Error>) -> Void) {
        // 获取应用沙盒的 Documents 目录路径
        let fileManager = FileManager.default
        if let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            // 拼接 genes 目录路径
            let genesDirectoryURL = documentsDirectory.appendingPathComponent(directoryName)
            
            do {
                // 获取 genes 目录下的所有文件 URL
                let fileURLs = try fileManager.contentsOfDirectory(at: genesDirectoryURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
                
                // 过滤出所有的 JSON 文件
                let jsonFiles = fileURLs.filter { $0.pathExtension == "json" }
                
                // 初始化一个数组来存储所有解析的 Gene 对象
                var geneList: [Gene] = []
                
                // JSONDecoder 实例，用于解析 JSON 文件
                let decoder = JSONDecoder()
                
                // 遍历所有 JSON 文件并解析成 Gene 对象
                for jsonFile in jsonFiles {
                    do {
                        let data = try Data(contentsOf: jsonFile)
                        let gene = try decoder.decode(Gene.self, from: data)
                        geneList.append(gene)
                    } catch {
                        print("解析文件 \(jsonFile.lastPathComponent) 时出错: \(error)")
                    }
                }
                
                // 完成回调，传回解析的 Gene 对象数组
                completion(.success(geneList))
            } catch {
                // 如果访问目录失败，返回错误
                completion(.failure(error))
                print("目录访问错误：\(error)")
            }
        } else {
            // 如果无法找到 Documents 目录，返回失败
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "无法找到 Documents 目录"])))
        }
    }
}
