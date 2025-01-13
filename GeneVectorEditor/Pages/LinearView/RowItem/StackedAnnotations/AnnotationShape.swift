//
//  AnnotationShape.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/14/25.
//

import SwiftUI

struct AnnotationShape {
    var widthInBps: Int
    var charWidth: Double
    var height: Double
    var pointiness: Double
    var forward: Bool
    
    func getPath() -> Path {
        let width = Double(widthInBps) * charWidth
        var path = Path()

        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: width - pointiness / 2, y: 0))
        path.addQuadCurve(to: CGPoint(x: width + pointiness / 2, y: height / 2), control: CGPoint(x: width, y: 0))
        path.addLine(to: CGPoint(x: width - pointiness / 2, y: height))
        path.addQuadCurve(to: CGPoint(x: 0, y: height), control: CGPoint(x: pointiness, y: height / 2))
        path.addLine(to: CGPoint(x: 0, y: 0))

        return path
    }
}
