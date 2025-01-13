//
//  AnnotationDimensions.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/14/25.
//

import SwiftUI

struct AnnotationDimensions {
    var widthInBps: Int
    var charWidth: Double
    var height: Double
    var extraHeight: Double
    var flipAnnotation: Bool
    var gapsInside: Double
    var gapsBefore: Double
    
    init(widthInBps: Int, charWidth: Double, height: Double, extraHeight: Double = 0, flipAnnotation: Bool = false, gapsInside: Double = 0, gapsBefore: Double = 0) {
        self.widthInBps = widthInBps
        self.charWidth = charWidth
        self.height = height
        self.extraHeight = extraHeight
        self.flipAnnotation = flipAnnotation
        self.gapsInside = gapsInside
        self.gapsBefore = gapsBefore
    }
    
    var width: Double {
        return Double(widthInBps + Int(gapsInside)) * charWidth
    }
    
    func textOffset(nameLength: Int, pointiness: Double) -> Double {
        return width / 2 - Double(nameLength * 5) / 2 - (pointiness / 2)
    }
}
