//
//  Primer.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/2/25.
//

import Foundation

// Primer 模型
struct Primer: Identifiable, Codable {
    let id: String
    let notes: Notes // notes 是一个 PrimerNotes 类型的字典
    let type: String
    let strand: Int
    let forward: Bool
    let name: String
    let start: Int
    let end: Int
    let annotationTypePlural: String
    let color: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case notes
        case type
        case strand
        case forward
        case name
        case start
        case end
        case annotationTypePlural
        case color
    }
}
