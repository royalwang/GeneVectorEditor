//
//  SequenceRenderer.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/14/25.
//


import SwiftUI

struct SequenceRenderer: View {
    var dnaSequence: DNASequence
    var charWidth: CGFloat
    var scrollData: ScrollData
    var rowStart: Int
    var rowEnd: Int
    var chunkSize: Int
    
    var body: some View {
        let numChunks = Int(ceil(Double(dnaSequence.sequence.count) / Double(chunkSize)))
        let chunkWidth = CGFloat(chunkSize) * charWidth
        let visibleRegion = getVisibleRegion()
        
        return HStack(spacing: 0) {
            // 使用 Group 来包裹条件渲染
            ForEach(0..<numChunks, id: \.self) { i in
                let seqChunk = dnaSequence.getChunk(chunkSize: chunkSize, chunkNumber: i)
                let textLength = CGFloat(seqChunk.count) * charWidth
                let x = CGFloat(i) * chunkWidth
                
                // 仅渲染可见区域内的块
                Group {
                    if x > visibleRegion.end || x + textLength < visibleRegion.start {
                        EmptyView()
                    } else {
                        Text(seqChunk)
                            .frame(width: textLength)
                            .offset(x: x)
                    }
                }
            }
        }
    }
    
    // 获取可见区域（示例实现）
    func getVisibleRegion() -> (start: CGFloat, end: CGFloat) {
        return (scrollData.visibleStart, scrollData.visibleEnd)
    }
}

struct SequenceRenderer_Previews: PreviewProvider {
    static var previews: some View {
        SequenceRenderer(
            dnaSequence: DNASequence(sequence: "AGCTGATCGATCGATCGATCGATCGATCGATCGAT"),
            charWidth: 10,
            scrollData: ScrollData(visibleStart: 0, visibleEnd: 100),
            rowStart: 0,
            rowEnd: 40,
            chunkSize: 10
        )
    }
}
