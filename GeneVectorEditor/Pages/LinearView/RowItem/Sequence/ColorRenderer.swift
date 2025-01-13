//
//  ColorRenderer.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/14/25.
//

import SwiftUI

struct ColorRenderer: View {
    var sequence: String
    var charWidth: CGFloat
    var height: CGFloat
    var totalWidth: CGFloat
    var fudge: CGFloat
    
    var body: some View {
        let colorPaths = getColorPaths()
        
//        return HStack {
//            ForEach(colorPaths.keys.sorted(), id: \.self) { color in
//                Path { path in
//                    print("Path for \(color): \(colorPaths[color])")
//                    path.addPath(colorPaths[color]!)
//                }
//                .fill(getColor(color))
//                .border(Color.black) // 临时添加边框查看路径
//            }
//        }

        
        return ZStack {
            ForEach(colorPaths.keys.sorted(), id: \.self) { color in
                Path { path in
                    path.addPath(colorPaths[color]!)
                }
                .fill(getColor(color)) // 将颜色字符串转换为 Color 对象
            }
        }
        .scaleEffect(x: (totalWidth - fudge) / totalWidth, y: 1)
    }
    
    func getColorPaths() -> [String: Path] {
        var colorPaths: [String: Path] = [:]
        
        for (index, char) in sequence.enumerated() {
            let width = charWidth
            let color = getDnaColor(char)
            let x = CGFloat(index) * charWidth
            let y: CGFloat = 0
            
            // 创建路径
            let path = Path { path in
                path.move(to: CGPoint(x: x, y: y))
                path.addLine(to: CGPoint(x: x + width, y: y))
                path.addLine(to: CGPoint(x: x + width, y: y + height))
                path.addLine(to: CGPoint(x: x, y: y + height))
                path.closeSubpath()
            }
            
            // 如果已有该颜色路径，添加新路径，否则创建新的路径
            if colorPaths[color] == nil {
                colorPaths[color] = path
            } else {
                colorPaths[color]?.addPath(path)
            }
        }
        
        return colorPaths
    }
    
    // 根据 DNA 碱基来获取颜色
    func getDnaColor(_ char: Character) -> String {
        switch char {
        case "A": return "green"
        case "T": return "blue"
        case "C": return "red"
        case "G": return "yellow"
        default: return "gray"
        }
    }
    
    // 根据 DNA 碱基来获取颜色
    func getColor(_ color: String) -> Color {
        switch color {
        case "green": return .green
        case "blue": return .blue
        case "red": return .red
        case "yellow": return .yellow
        default: return .gray
        }
    }
}

struct ColorRenderer_ContentView: PreviewProvider {
    static var previews: some View {
        let sequence = "ATCGGCTA"
        ColorRenderer(sequence: sequence, charWidth: 20, height: 30, totalWidth: 200, fudge: 5)
            .padding()
    }
}

