//
//  Translation.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/2/25.
//

import Foundation

// Translation 模型
struct GeneTranslation: Identifiable, Codable {
    let id: String
    let notes: Notes // notes 是一个 TranslationNotes 类型的字典
    let type: String
    let strand: Int
    let forward: Bool
    let name: String
    let start: Int
    let end: Int
    let annotationTypePlural: String
    let color: String
    let translationType: String
    
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
        case translationType
    }
}
