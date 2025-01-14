//
//  OptimizedDNASequenceView.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/14/25.
//


import SwiftUI

struct OptimizedDNASequenceView: View {
    let forwardSequence: String
    let chunkSize: Int = 50 // 每次加载的字符块大小
    let charWidth: CGFloat = 14
    let height: CGFloat = 20
    let tickSpacing: Int = 10
    
    private var reverseSequence: String
    private var sequenceLength: Int
    
    init(forwardSequence: String) {
        self.forwardSequence = forwardSequence
        self.reverseSequence = reverseComplement(dnaSequence: forwardSequence)
        self.sequenceLength = forwardSequence.count
    }

    var body: some View {
        VStack(spacing: 5) {
            // 渲染前向序列
            LazySequenceRowView(
                sequence: forwardSequence,
                direction: "5'",
                reverseDirection: "3'",
                chunkSize: chunkSize,
                charWidth: charWidth,
                charColor: .black
            )
            
            // 渲染反向序列
            LazySequenceRowView(
                sequence: reverseSequence,
                direction: "3'",
                reverseDirection: "5'",
                chunkSize: chunkSize,
                charWidth: charWidth,
                charColor: .gray
            )
            
            // 渲染坐标轴
            AxisView2(
                tickSpacing: tickSpacing,
                sequenceLength: sequenceLength,
                charWidth: charWidth,
                horizontalPadding: 8
            )
        }
        .padding()
    }
}

struct LazySequenceRowView: View {
    let sequence: String
    let direction: String
    let reverseDirection: String
    let chunkSize: Int
    let charWidth: CGFloat
    let charColor: Color

    var body: some View {
        HStack(spacing: 0) {
            Text(direction)
                .foregroundColor(.gray)
                .padding(.trailing, 8)

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 0) {
                    ForEach(0..<sequence.count / chunkSize + 1, id: \.self) { chunkIndex in
                        let start = chunkIndex * chunkSize
                        let end = min((chunkIndex + 1) * chunkSize, sequence.count)
                        let safeStart = max(0, start)
                        let safeEnd = min(sequence.count, end)
                        let startIndex = sequence.index(sequence.startIndex, offsetBy: safeStart)
                        let endIndex = sequence.index(sequence.startIndex, offsetBy: safeEnd)

                        if safeStart < safeEnd { // 确保范围非空
                            let chunk = String(sequence[startIndex..<endIndex])
                            Text(chunk)
                                .font(.system(size: 16))
                                .foregroundColor(charColor)
                                .frame(width: CGFloat(chunk.count) * charWidth, height: 20, alignment: .leading)
                        }
                    }
                }
            }

            Text(reverseDirection)
                .foregroundColor(.gray)
                .padding(.leading, 8)
        }
    }
}

struct AxisView2: View {
    let tickSpacing: Int
    let sequenceLength: Int
    let charWidth: CGFloat
    let horizontalPadding: CGFloat

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer().frame(width: horizontalPadding) // 左边空白
                Rectangle()
                    .frame(width: CGFloat(sequenceLength) * charWidth, height: 1)
                    .foregroundColor(.black)
                Spacer().frame(width: horizontalPadding) // 右边空白
            }
            
            HStack(spacing: 0) {
                Spacer().frame(width: horizontalPadding) // 左边空白
                
                ForEach(0..<sequenceLength / tickSpacing + 1, id: \.self) { tickIndex in
                    let position = tickIndex * tickSpacing
                    if position < sequenceLength {
                        VStack(spacing: 0) {
                            Rectangle()
                                .frame(width: 1, height: 10)
                                .foregroundColor(.black)
                            Text("\(position)")
                                .font(.system(size: 10))
                                .frame(width: charWidth * CGFloat(tickSpacing), alignment: .center)
                        }
                    }
                }
                
                Spacer().frame(width: horizontalPadding) // 右边空白
            }
        }
    }
}
