//
//  PointedAnnotationView.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/14/25.
//


import SwiftUI

struct PointedAnnotationView2: View {
    var className: String
    var widthInBps: Double
    var charWidth: Double
    var height: CGFloat
    var rangeType: String
    var forward: Bool
    var arrowheadType: String
    var name: String
    var customName: String?
    var type: String
    var readOnly: Bool
    var isStriped: Bool
    var onMouseLeave: (() -> Void)?
    var onMouseOver: (() -> Void)?
    var isProtein: Bool
    var id: String
    var extraHeight: CGFloat
    var flipAnnotation: Bool
    var insertPaths: String?
    var insertTicks: String?
    var hideName: Bool
    var color: Color
    var fill: Color
    var stroke: Color
    var opacity: Double
    var onClick: (() -> Void)?
    var onDoubleClick: (() -> Void)?
    var textColor: Color
    var onRightClick: (() -> Void)?
    var gapsInside: Double
    var gapsBefore: Double
    var annotation: Any
    var truncateLabelsThatDoNotFit: Bool
    var onlyShowLabelsThatDoNotFit: Bool

    @State private var isOpen = false
    @State private var isOpen2 = false
    @State private var nameToDisplay: String = ""

    var body: some View {
        Canvas { context, size in
            let width = (widthInBps + gapsInside) * charWidth
            let path = generatePath(for: size, width: width)
            
            // Draw path
            context.fill(path, with: .color(color))
            context.stroke(path, with: .color(stroke), lineWidth: 1)

            // Add label if needed
            if !hideName && !nameToDisplay.isEmpty {
                context.draw(Text(nameToDisplay)
                    .font(.system(size: 12))
                    .foregroundColor(textColor), at: CGPoint(x: size.width / 2, y: size.height - 10))
            }

            // Add striped pattern if isStriped
            if isStriped {
                // Placeholder for striped pattern
                // Use context.drawPattern or other methods if available
            }
            
            // Tooltip and interactions (handle separately in SwiftUI)
        }
        .frame(width: widthInBps * charWidth + gapsInside * charWidth, height: height)
        .onTapGesture {
            onClick?()
        }
        .onLongPressGesture {
            onDoubleClick?()
        }
        .onHover { isHovering in
            if isHovering {
                onMouseOver?()
            } else {
                onMouseLeave?()
            }
        }
        .contextMenu {
            Button("Right-click Action") {
                onRightClick?()
            }
        }
    }
    
    func generatePath(for size: CGSize, width: CGFloat) -> Path {
        var path = Path()
        
        let pointiness: CGFloat = arrowheadType == "NONE" ? 0 : 4
        let arrowPointiness: CGFloat = arrowheadType == "NONE" ? 0 : 1
        let widthMinusOne = width - arrowPointiness * 15
        
        // Starting from the top left of the annotation
        if rangeType == "middle" {
            // Draw a rectangle
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: width - pointiness / 2, y: 0))
            path.addQuadCurve(to: CGPoint(x: width + pointiness / 2, y: size.height / 2), control: CGPoint(x: width, y: 0))
            path.addLine(to: CGPoint(x: width - pointiness / 2, y: size.height))
            path.addLine(to: CGPoint(x: 0, y: size.height))
            path.addQuadCurve(to: CGPoint(x: pointiness, y: size.height / 2), control: CGPoint(x: 0, y: size.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
        }
        // More path options based on rangeType...
        
        return path
    }
}

struct PointedAnnotationView2_ContentView: View {
    var body: some View {
        PointedAnnotationView2(
            className: "annotation-class",
            widthInBps: 100,
            charWidth: 10,
            height: 40,
            rangeType: "middle",
            forward: true,
            arrowheadType: "NONE",
            name: "Sample Annotation",
            customName: nil,
            type: "gene",
            readOnly: false,
            isStriped: false,
            onMouseLeave: nil,
            onMouseOver: nil,
            isProtein: false,
            id: "annotation-1",
            extraHeight: 10,
            flipAnnotation: false,
            insertPaths: nil,
            insertTicks: nil,
            hideName: false,
            color: .orange,
            fill: .orange,
            stroke: .black,
            opacity: 1.0,
            onClick: nil,
            onDoubleClick: nil,
            textColor: .black,
            onRightClick: nil,
            gapsInside: 0,
            gapsBefore: 0,
            annotation: "Sample annotation",
            truncateLabelsThatDoNotFit: false,
            onlyShowLabelsThatDoNotFit: false
        )
    }
}

struct PointedAnnotationView2_Previews: PreviewProvider {
    static var previews: some View {
        PointedAnnotationView2_ContentView()
    }
}
