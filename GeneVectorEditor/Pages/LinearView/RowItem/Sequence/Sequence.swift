//
//  Sequence.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/14/25.
//


import SwiftUI

struct Sequence: View {
    var dnaSequence: DNASequence
    var charWidth: CGFloat
    var scrollData: ScrollData
    var rowStart: Int
    var rowEnd: Int
    var chunkSize: Int
    var showDnaColors: Bool
    var annotations: [Annotation]
    var height: CGFloat
    var fudge: CGFloat
    
    var body: some View {
        VStack {
            if showDnaColors {
                ColorRenderer(sequence: dnaSequence.sequence, charWidth: charWidth, height: height, totalWidth: CGFloat(dnaSequence.sequence.count) * charWidth, fudge: fudge)
            }
            SequenceRenderer(dnaSequence: dnaSequence, charWidth: charWidth, scrollData: scrollData, rowStart: rowStart, rowEnd: rowEnd, chunkSize: chunkSize)
            AnnotatedSequenceView(sequence: dnaSequence.sequence, annotations: annotations, rowStart: rowStart, sequenceLength: dnaSequence.sequenceLength)
        }
    }
}
