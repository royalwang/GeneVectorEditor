//
//  GeneService.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/2/25.
//

import Foundation

class GeneService {
    func fetchGeneData(completion: @escaping (Result<[Gene], Error>) -> Void) {
        guard let url = Bundle.main.url(forResource: "genes", withExtension: "json") else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "JSON 文件未找到"])))
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let geneList = try decoder.decode([Gene].self, from: data)
            completion(.success(geneList))
        } catch {
            completion(.failure(error))
            print("JSON解析错误：\(error)")
        }
    }
}
