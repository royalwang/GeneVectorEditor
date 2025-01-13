//
//  Annotation.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/14/25.
//


import SwiftUI

struct Annotation: Identifiable, Hashable {
    var id: UUID = UUID()
    var start: Int
    var end: Int
}

struct AnnotatedSequenceView: View {
    var sequence: String
    var annotations: [Annotation]
    var rowStart: Int
    var sequenceLength: Int
    
    @State private var boldRegion: [String] = []
    
    // 初始化时计算需要高亮显示的区域
    init(sequence: String, annotations: [Annotation], rowStart: Int, sequenceLength: Int) {
        self.sequence = sequence
        self.annotations = annotations
        self.rowStart = rowStart
        self.sequenceLength = sequenceLength
        self._boldRegion = State(initialValue: AnnotatedSequenceView.calculateBoldRegion(sequence: sequence, annotations: annotations, rowStart: rowStart, sequenceLength: sequenceLength))
    }
    
    var body: some View {
        Text(sequence)
            .overlay(
                getBoldRegion(),
                alignment: .topLeading
            )
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    // 优化：将高亮区域的计算提取为一个函数
    static func calculateBoldRegion(sequence: String, annotations: [Annotation], rowStart: Int, sequenceLength: Int) -> [String] {
        var boldText: [String] = []
        
        for index in rowStart..<sequence.count + rowStart {
            let element = sequence[sequence.index(sequence.startIndex, offsetBy: index)]
            // 查找所有注释中是否有匹配的区域
            let isBold = annotations.contains { $0.start <= index && $0.end >= index }
            boldText.append(isBold ? String(element).uppercased() : String(element))
        }
        
        return boldText
    }
    
    // 获取需要高亮显示的区域
    func getBoldRegion() -> some View {
        // 使用 lazy 视图来避免不必要的布局
        LazyHStack {
            ForEach(boldRegion, id: \.self) { text in
                Text(text)
                    .fontWeight(.bold)
            }
        }
    }
}

struct AnnotatedSequenceView_Previews: PreviewProvider {
    static var previews: some View {
        AnnotatedSequenceView(
            sequence: "AGCTGATCGATCGATCGATCGATCGATCGATCGAT",
            annotations: [Annotation(start: 5, end: 10), Annotation(start: 15, end: 20)],
            rowStart: 0,
            sequenceLength: 40
        )
    }
}
