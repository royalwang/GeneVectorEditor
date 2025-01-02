//
//  GeneData.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/2/25.
//


import SwiftUI

class GeneData: ObservableObject {
    @Published var genes: [Gene] = []
    
    // 从本地 JSON 文件加载数据
    func loadGenes() {
        if let url = Bundle.main.url(forResource: "genes", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decodedGenes = try JSONDecoder().decode([Gene].self, from: data)
                DispatchQueue.main.async {
                    self.genes = decodedGenes
                }
            } catch {
                print("Error loading or decoding genes.json: \(error)")
            }
        } else {
            print("genes.json file not found.")
        }
    }
}
