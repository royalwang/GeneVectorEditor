//
//  Part.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/2/25.
//

import Foundation

struct GenePart: Identifiable, Codable {
    let id: String           // Unique identifier for the part
    let name: String         // Name of the part
    let size: Int            // Size of the part in base pairs (bp)
    let strand: Int          // Strand direction: 1 (Forward), -1 (Reverse)
    let tags: [String]?      // Tags or categories associated with the part
    let color: String        // Hex color code for part representation
    
    let description: String? // Optional description for additional context
    let sequence: String?    // Optional sequence data for the part
}
