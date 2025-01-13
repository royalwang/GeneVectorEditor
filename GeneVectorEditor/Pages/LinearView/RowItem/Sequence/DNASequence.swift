//
//  DNASequence.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/14/25.
//


import Foundation

class DNASequence {
    var sequence: String
    var sequenceLength: Int
    
    init(sequence: String) {
        self.sequence = sequence.uppercased()
        self.sequenceLength = sequence.lengthOfBytes(using: String.Encoding.ascii)
    }
    
    func getChunk(chunkSize: Int, chunkNumber: Int) -> String {
        let start = chunkSize * chunkNumber
        // 计算 end 时，确保不会超过 sequence 的长度
        let end = min(chunkSize * (chunkNumber + 1), sequence.count)
        
        // 确保 start 和 end 都在字符串的有效范围内
        guard start < sequence.count else {
            return "" // 如果 start 已经超出了范围，返回空字符串
        }
        
        let range = sequence.index(sequence.startIndex, offsetBy: start)..<sequence.index(sequence.startIndex, offsetBy: end)
        return String(sequence[range])
    }

}
