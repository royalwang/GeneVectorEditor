//
//  DNASequenceView.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/14/25.
//


import SwiftUI

func reverseComplement(dnaSequence: String) -> String {
    // 创建互补碱基字典
    let complementMap: [Character: Character] = [
        "a": "t", "t": "a",
        "c": "g", "g": "c"
    ]

    // 将序列反转，并生成互补碱基
    let reverseComplementSequence = dnaSequence.reversed().compactMap { complementMap[$0] }
    
    // 返回反向互补序列
    return String(reverseComplementSequence)
}

struct DNASequenceView: View {
    let forwardSequence: String
    let charWidth: CGFloat = 14
    let height: CGFloat = 20
    let tickSpacing: Int = 10
    
    
    private var reverseSequence: String
    private var sequenceLength: Int
    
    init(forwardSequence: String) {
        self.forwardSequence = forwardSequence
        self.reverseSequence = reverseComplement(dnaSequence: forwardSequence)
        self.sequenceLength = forwardSequence.lengthOfBytes(using: String.Encoding.ascii)
    }

    var body: some View {
        VStack(spacing: 5) {
            
            // 前向序列
            SequenceRowView(sequence: forwardSequence, direction: "5'", reverseDirection: "3'", charWidth: charWidth, charColor: Color.black)

            // 反向序列
            SequenceRowView(sequence: reverseSequence, direction: "3'", reverseDirection: "5'", charWidth: charWidth, charColor: Color.gray)
            
            // 轴标
            AxisView(tickSpacing: tickSpacing, sequenceLength: forwardSequence.lengthOfBytes(using: String.Encoding.ascii), charWidth: charWidth, horizontalPadding: 0)
                
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct SequenceRowView: View {
    let sequence: String
    let direction: String
    let reverseDirection: String
    let charWidth: CGFloat
    let charColor: Color

    var body: some View {
        HStack(spacing: 0) {
            Text(direction)
                .foregroundColor(.gray)
                .padding(.trailing, 8)

            ForEach(0..<sequence.count, id: \.self) { index in
                Text(String(sequence[sequence.index(sequence.startIndex, offsetBy: index)]))
                    .font(.system(size: 16))
                    .foregroundColor(charColor)
                    .frame(width: charWidth, height: 20, alignment: .leading)
            }

            Text(reverseDirection)
                .foregroundColor(.gray)
                .padding(.leading, 8)
        }
    }
}


struct AxisView: View {
    let tickSpacing: Int
    let sequenceLength: Int
    let charWidth: CGFloat
    let horizontalPadding: CGFloat // 横向空白间距
    
    var body: some View {
        VStack(spacing: 0) {
            // 添加水平轴线
            HStack {
                Spacer().frame(width: horizontalPadding) // 左边空白
                Rectangle()
                    .frame(width: CGFloat(sequenceLength) * charWidth, height: 1)
                    .foregroundColor(.black)
                    .offset(y: 0) // 让线位于刻度线的上方
                Spacer().frame(width: horizontalPadding) // 右边空白
            }
            
            // 绘制刻度和刻度标签
            HStack(spacing: 0) {
                Spacer().frame(width: horizontalPadding) // 左边空白
                
                ForEach(1..<sequenceLength, id: \.self) { index in
                    if index % tickSpacing == 0 {
                        VStack(spacing: 0) {
                            Rectangle()
                                .frame(width: 1, height: 10) // 刻度线
                                .foregroundColor(.black)
                            Text("\(index)")
                                .font(.system(size: 10))
                                .frame(width: charWidth, alignment: .center)
                        }
                        .frame(width: charWidth) // 保证每个字符占用相同的宽度
                    } else {
                        Spacer().frame(width: charWidth)
                    }
                }
                
                Spacer().frame(width: horizontalPadding) // 右边空白
            }
        }
        .frame(width: CGFloat(sequenceLength) * charWidth, height: 20)
    }
}

struct AxisView_ContentView: View {
    var body: some View {
        VStack {
            AxisView(
                tickSpacing: 10,
                sequenceLength: 100,
                charWidth: 16,
                horizontalPadding: 0
            )
            .frame(height: 20)
        }
        .padding()
    }
}


struct DNASequenceView_ContentView: View {
    var body: some View {
//        DNASequenceView(
//            forwardSequence: "attatcatgacattaacctataaaaataggcgtatcacgaggccctttcgtcttcaagaattcccgacaccatcgaatggtgcaaaa",
//            reverseSequence: "taatagtactgtaattggatatttttatccgcatagtgctccgggaaagcagaagttcttaagggctgtggtagcttaccacgtttt",
//            sequenceLength: 100
//        )
        DNASequenceView(forwardSequence: "attatcatgacattaacctataaaaataggcgtatcacgaggccctttcgtcttcaagaattcc")
    }
}

//struct DNASequenceView_Priviews: PreviewProvider {
//    static var previews: some View {
//        DNASequenceView(
//            forwardSequence: "attatcatgacattaacctataaaaataggcgtatcacgaggccctttcgtcttcaagaattcccgacaccatcgaatggtgcaaaa",
//            reverseSequence: "taatagtactgtaattggatatttttatccgcatagtgctccgggaaagcagaagttcttaagggctgtggtagcttaccacgtttt",
//            sequenceLength: 100
//        )
//    }
//}
