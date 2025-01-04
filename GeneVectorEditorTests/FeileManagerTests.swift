//
//  FeileManagerTests.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/4/25.
//

import XCTest
@testable import GeneVectorEditor

final class FileManagerTests: XCTestCase {
    
    func testGeneFileManager() {
        let geneManager = GeneFileManager.shared

        // 添加测试数据
        let testGene1 = "ATCGTTGCAATCGTTGCAATCGTTGCAATCGTTGCAATCGTTGCA"
        let testGene2 = "AATTCCGGTTAAACCCGGGTTTAAACCCGGGTTTAACCCTTGGCC"

        geneManager.addGeneFile(fileName: "Gene1.txt", sequence: testGene1)
        geneManager.addGeneFile(fileName: "Gene2.txt", sequence: testGene2)

        // 列出所有文件
        let files = geneManager.listGeneFiles()
        print("Files in genes directory: \(files)")
    }
    
    func testGeneFileManager2() {
        let geneManager = GeneFileManager.shared

        // 添加测试数据
        let testGene1 = "ATCGTTGCAATCGTTGCAATCGTTGCAATCGTTGCAATCGTTGCA"
        let testGene2 = "AATTCCGGTTAAACCCGGGTTTAAACCCGGGTTTAACCCTTGGCC"
        let updatedGene1 = "TTGCAATCGTTGCAATCGTTGCAATCGTTGCAATCGTTGCAATCG"

        geneManager.addGeneFile(fileName: "Gene1.txt", sequence: testGene1)
        geneManager.addGeneFile(fileName: "Gene2.txt", sequence: testGene2)

        // 更新 Gene1 文件内容
        geneManager.updateGeneFile(fileName: "Gene1.txt", newSequence: updatedGene1)

        // 读取更新后的 Gene1 内容
        if let content = geneManager.readGeneFile(fileName: "Gene1.txt") {
            print("Updated content of Gene1.txt:\n\(content)")
        }

        // 列出所有文件
        let files = geneManager.listGeneFiles()
        print("Files in genes directory: \(files)")

        // 删除 Gene2 文件
        geneManager.deleteGeneFile(fileName: "Gene2.txt")

        // 再次列出文件
        let filesAfterDeletion = geneManager.listGeneFiles()
        print("Files in genes directory after deletion: \(filesAfterDeletion)")
    }
}


