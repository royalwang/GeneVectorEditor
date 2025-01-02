//
//  ORF.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/3/25.
//

import SwiftUI

struct GeneORFs: Identifiable, Codable {
    let id: String
    let size: Int       // Size in base pairs (bp)
    let sizeAA: Int     // Size in amino acids (aa)
    let strand: Int     // Strand direction: 1 (Forward), -1 (Reverse)
    let frame: Int      // Reading frame: 0, 1, or 2
    let color: String   // Hex color code
}
