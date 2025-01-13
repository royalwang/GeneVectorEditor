//
//  PointedAnnotation 2.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/14/25.
//

import SwiftUI

struct PointedAnnotation: View {
    var style: AnnotationStyle
    var dimensions: AnnotationDimensions
    var interactions: AnnotationInteractions
    var content: AnnotationContent
    var shape: AnnotationShape
    var forward: Bool
    
    var body: some View {
        let path = shape.getPath()
        let (nameToDisplay, textOffset) = content.getNameToDisplay(width: dimensions.width, charWidth: dimensions.charWidth, pointiness: shape.pointiness)
        
        return ZStack {
            path
                .stroke(style.stroke, lineWidth: 2)
                .fill(style.fill.opacity(style.opacity))
            
            Text(nameToDisplay)
                .font(.system(size: 14))
                .foregroundColor(style.textColor)
                .offset(x: textOffset, y: dimensions.height - 2)
        }
        .onTapGesture {
            interactions.onClick()
        }
        .onLongPressGesture {
            interactions.onDoubleClick()
        }
        .simultaneousGesture(LongPressGesture().onEnded { _ in
            interactions.onRightClick()
        })
    }
}

struct PointedAnnotation_Previews: PreviewProvider {
    static var previews: some View {
        PointedAnnotation(
            style: AnnotationStyle(),
            dimensions: AnnotationDimensions(widthInBps: 100, charWidth: 5, height: 20),
            interactions: AnnotationInteractions(onClick: { print("clicked") }),
            content: AnnotationContent(name: "Sample Annotation"),
            shape: AnnotationShape(widthInBps: 100, charWidth: 5, height: 20, pointiness: 4, forward: true),
            forward: true
        )
        .frame(width: 200, height: 100)
    }
}
