//
//  Notes.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/2/25.
//

import Foundation

// Notes 是一个字典，解析 JSON 时适配
struct Notes: Codable {
    let molType: [String]?
    let organism: [String]?
    let note: [String]?
    let boundMoiety: [String]?
    let codonStart: [Int]?
    let product: [String]?
    let translation: [String]?
    let gene: [String]?
    
    enum CodingKeys: String, CodingKey {
        case molType = "mol_type"
        case organism
        case note
        case boundMoiety = "bound_moiety"
        case codonStart = "codon_start"
        case product
        case translation
        case gene
    }
}
