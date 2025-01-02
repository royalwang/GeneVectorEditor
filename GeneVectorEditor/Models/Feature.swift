//
//  Feature.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/2/25.
//

import Foundation

struct Feature: Identifiable, Codable {
    let id: String
    let notes: Notes // 这里是字典
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

