//
//  DNASequenceView 2.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/14/25.
//


import SwiftUI

struct DNASequenceCanvasView: View {
    let forwardSequence: String
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
            // 前向序列
            SequenceCanvas(sequence: forwardSequence, charWidth: charWidth, height: height, direction: "5'", reverseDirection: "3'", textColor: .black)
            
            // 反向序列
            SequenceCanvas(sequence: reverseSequence, charWidth: charWidth, height: height, direction: "3'", reverseDirection: "5'", textColor: .gray)
            
            // 坐标轴
            AxisCanvas(sequenceLength: sequenceLength, charWidth: charWidth, tickSpacing: tickSpacing)
                .frame(height: 30)
        }
        .padding()
    }
}

struct SequenceCanvas: View {
    let sequence: String
    let charWidth: CGFloat
    let height: CGFloat
    let direction: String
    let reverseDirection: String
    let textColor: Color
    
    var body: some View {
        Canvas { context, size in
            let yOffset: CGFloat = height / 2
            
            // 绘制方向
            context.draw(Text(direction).foregroundColor(.gray), at: CGPoint(x: 10, y: yOffset))
            
            // 绘制序列
            for (index, char) in sequence.enumerated() {
                let xPosition = CGFloat(index + 1) * charWidth + 20
                let text = Text(String(char)).foregroundColor(textColor).monospaced()
                context.draw(text, at: CGPoint(x: xPosition - 10, y: yOffset))
            }
            
            // 绘制反方向
            let reverseXPosition = CGFloat(sequence.count + 1) * charWidth
            context.draw(Text(reverseDirection).foregroundColor(.gray), at: CGPoint(x: reverseXPosition, y: yOffset))
        }
        .frame(height: height)
    }
}

struct AxisCanvas: View {
    let sequenceLength: Int
    let charWidth: CGFloat
    let tickSpacing: Int
    
    var body: some View {
        Canvas { context, size in
            let lineYPosition: CGFloat = 15
            let tickHeight: CGFloat = 10
            
            // 绘制轴线
            context.stroke(
                Path { path in
                    path.move(to: CGPoint(x: 20, y: 0))
                    path.addLine(to: CGPoint(x: CGFloat(sequenceLength) * charWidth - 10, y: 0))
                },
                with: .color(.black),
                lineWidth: 1
            )
            
            // 绘制刻度和刻度标签
            for index in 1..<sequenceLength {
                if index % tickSpacing == 0 {
                    let xPosition = CGFloat(index) * charWidth
                    // 绘制刻度线
                    context.stroke(
                        Path { path in
                            path.move(to: CGPoint(x: xPosition, y: lineYPosition))
                            path.addLine(to: CGPoint(x: xPosition, y: lineYPosition - tickHeight))
                        },
                        with: .color(.black),
                        lineWidth: 1
                    )
                    
                    // 绘制刻度标签
                    let text = Text("\(index)").font(.system(size: 10)).monospaced()
                    context.draw(text, at: CGPoint(x: xPosition, y: lineYPosition - tickHeight - 10))
                }
            }
        }
    }
}


struct DNASequenceView_Previews: PreviewProvider {
    static var previews: some View {
        DNASequenceCanvasView(forwardSequence: "ATTATCATGACATTAA")
    }
}
