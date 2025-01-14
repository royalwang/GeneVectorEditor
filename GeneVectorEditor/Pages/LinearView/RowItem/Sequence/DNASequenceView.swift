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

//struct AxisView: View {
//    let tickSpacing: Int
//    let sequenceLength: Int
//    let charWidth: CGFloat
//
//    var body: some View {
//        HStack(spacing: 0) {
//            ForEach(0..<sequenceLength, id: \.self) { index in
//                VStack {
//                    Rectangle()
//                        .frame(width: 10, height: 1)
//                    
//                    if index % tickSpacing == 0 {
//                        VStack {
//                            Rectangle()
//                                .frame(width: 1, height: 10)
//                            Text("\(index)")
//                                .font(.system(size: 10))
//                                .frame(width: charWidth, alignment: .center)
//                        }
//                    } else {
//                        Spacer().frame(width: charWidth)
//                    }
//                }
//            }
//        }
//    }
//}

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
