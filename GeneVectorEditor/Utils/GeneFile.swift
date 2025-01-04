//
//  GeneFile.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/4/25.
//

import SwiftUI

// 基因文件模型
struct GeneFile: Identifiable {
    let id = UUID()
    let name: String
    let size: String
    let lastModified: String
    let isCompleted: Bool
}
