//
//  DNASequenceView.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/14/25.
//


import SwiftUI

struct DNASequenceView: View {
    let forwardSequence: String
    let reverseSequence: String
    let charWidth: CGFloat = 14
    let height: CGFloat = 20
    let tickSpacing: Int = 10
    let sequenceLength: Int

    var body: some View {
        VStack(spacing: 5) {
            
            // 前向序列
            SequenceRowView(sequence: forwardSequence, direction: "5'", reverseDirection: "3'", charWidth: charWidth)

            // 反向序列
            SequenceRowView(sequence: reverseSequence, direction: "3'", reverseDirection: "5'", charWidth: charWidth)
            
            // 轴标
            AxisView(tickSpacing: tickSpacing, sequenceLength: sequenceLength, charWidth: charWidth)
        }
        .padding()
    }
}

struct SequenceRowView: View {
    let sequence: String
    let direction: String
    let reverseDirection: String
    let charWidth: CGFloat

    var body: some View {
        HStack(spacing: 0) {
            Text(direction)
                .foregroundColor(.gray)
                .padding(.trailing, 8)

            ForEach(0..<sequence.count, id: \.self) { index in
                Text(String(sequence[sequence.index(sequence.startIndex, offsetBy: index)]))
                    .font(.system(size: 16))
                    .frame(width: charWidth, height: 20, alignment: .center)
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

    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<sequenceLength, id: \.self) { index in
                if index % tickSpacing == 0 {
                    VStack {
                        Rectangle()
                            .frame(width: 1, height: 10)
                        Text("\(index)")
                            .font(.system(size: 10))
                            .frame(width: charWidth, alignment: .center)
                    }
                } else {
                    Spacer().frame(width: charWidth)
                }
            }
        }
    }
}

struct DNASequenceView_ContentView: View {
    var body: some View {
        DNASequenceView(
            forwardSequence: "attatcatgacattaacctataaaaataggcgtatcacgaggccctttcgtcttcaagaattcccgacaccatcgaatggtgcaaaa",
            reverseSequence: "taatagtactgtaattggatatttttatccgcatagtgctccgggaaagcagaagttcttaagggctgtggtagcttaccacgtttt",
            sequenceLength: 100
        )
    }
}

struct DNASequenceView_Priviews: PreviewProvider {
    static var previews: some View {
        DNASequenceView(
            forwardSequence: "attatcatgacattaacctataaaaataggcgtatcacgaggccctttcgtcttcaagaattcccgacaccatcgaatggtgcaaaa",
            reverseSequence: "taatagtactgtaattggatatttttatccgcatagtgctccgggaaagcagaagttcttaagggctgtggtagcttaccacgtttt",
            sequenceLength: 100
        )
    }
}
