//
//  ColorRenderer 2.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/14/25.
//


import SwiftUI

struct ColorRenderer2: View {
    var sequence: String
    var charWidth: CGFloat
    var height: CGFloat
    
    // 用于根据字符生成颜色
    func getDnaColor(for char: Character) -> Color {
        switch char {
        case "A": return .green
        case "T": return .blue
        case "C": return .red
        case "G": return .yellow
        default: return .gray
        }
    }
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(Array(sequence.enumerated()), id: \.offset) { index, char in
                // 获取当前字符的颜色
                let color = getDnaColor(for: char)
                // 使用背景色填充对应的区域
                Rectangle()
                    .fill(color)
                    .frame(width: charWidth, height: height)
            }
        }
    }
}

struct ColorRenderer2_Priviews: PreviewProvider {
    static var previews: some View {
        var sequence = "ATCGGCTA"
        ColorRenderer2(sequence: sequence, charWidth: 20, height: 30)
            .padding()
    }
}
