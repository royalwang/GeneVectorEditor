//
//  ScrollData.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/14/25.
//


import Foundation

struct ScrollData {
    var visibleStart: CGFloat
    var visibleEnd: CGFloat
}

class ScrollManager {
    var scrollData: ScrollData
    var charWidth: CGFloat
    var sequenceLength: Int
    
    init(scrollData: ScrollData, charWidth: CGFloat, sequenceLength: Int) {
        self.scrollData = scrollData
        self.charWidth = charWidth
        self.sequenceLength = sequenceLength
    }
    
    func getVisibleStartEnd() -> (start: CGFloat, end: CGFloat) {
//        let width = CGFloat(sequenceLength) * charWidth
        return (start: scrollData.visibleStart, end: scrollData.visibleEnd)
    }
}
