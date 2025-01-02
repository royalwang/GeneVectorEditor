//
//  Gene.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/2/25.
//

import Foundation

struct Gene: Identifiable, Codable {
    let id: String
    let date: String
    let description: String
    let isDoubleStrandedDNA: Bool
    let accession: String
    let type: String
    let extraLines: [String]?
    let features: [Feature]?
    let sequenceTypeFromLocus: String
    let definition: String
    let timestamp: Int
    let comments: [String]
    let circular: Bool
    let version: String
    let sequence: String
    let isDNA: Bool
    let size: Int
    let name: String
    let searchValue: String
    let primers: [Primer]?
    let user: Int
    let gbDivision: String
    let fileType: String
    let isProtein: Bool
    let fromServer: Bool
    let proteinSequence: String
    let proteinSize: Int
    let warnings: [String]
    let assemblyPieces: [String]
    let lineageAnnotations: [String]
    let parts: [String]
    let translations: [Translation]?
    let guides: [String]
    let materiallyAvailable: Bool
    let fromFileUpload: Bool
    let stateTrackingId: String
}
