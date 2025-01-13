////
////  PointedAnnotation.swift
////  GeneVectorEditor
////
////  Created by Wang Zhengdong on 1/13/25.
////
//
//import SwiftUI
//
//
//struct Annotation: Identifiable {
//    let id = UUID()
//    let position: Int
//    
//    // 添加计算属性 overlapsSelf
//    var overlapsSelf: Bool {
//        // 这里假设如果 position 大于某个值则重叠（可以根据实际需求调整）
//        return position > 50  // 示例逻辑
//    }
//    
//    init(position: Int) {
//        self.position = position
//    }
//    
//}
//
//struct PointedAnnotation: View {
//    var className: String
//    var widthInBps: CGFloat
//    var charWidth: CGFloat
//    var height: CGFloat
//    var rangeType: String
//    var forward: Bool
//    var arrowheadType: String
//    var name: String = ""
//    var customName: String?
//    var type: String
//    var readOnly: Bool
//    var isStriped: Bool
//    var onMouseLeave: (() -> Void)?
//    var onMouseOver: (() -> Void)?
//    var isProtein: Bool
//    var id: String
//    var extraHeight: CGFloat
//    var flipAnnotation: Bool
//    var insertPaths: String?
//    var insertTicks: String?
//    var hideName: Bool
//    var color: Color = .orange
//    var fill: Color?
//    var stroke: Color?
//    var opacity: Double
//    var onClick: () -> Void = {}
//    var onDoubleClick: () -> Void = {}
//    var textColor: Color?
//    var onRightClick: () -> Void = {}
//    var gapsInside: Int
//    var gapsBefore: Int
//    var annotation: Annotation
//    var truncateLabelsThatDoNotFit: Bool
//    var onlyShowLabelsThatDoNotFit: Bool
//
//    @State private var isOpen = false
//    @State private var isOpen2 = false
//
//    private var pointiness: CGFloat {
//        arrowheadType == "NONE" ? 0 : 4
//    }
//
//    private var arrowPointiness: CGFloat {
//        arrowheadType == "NONE" ? 0 : 1
//    }
//
//    private var width: CGFloat {
//        (widthInBps + CGFloat(gapsInside)) * charWidth
//    }
//
//    private var classNames: String {
//        getAnnotationClassnames(annotation, isProtein: isProtein, type: type)
//    }
//
//    private var path: Path {
//        var path = Path()
//
//        let widthMinusOne = width - arrowPointiness * charWidth
////        let startLines = "M 0,0 \(insertPaths ?? "")"
////        let bottomLine = "\(insertTicks ?? "") L 0,\(height)"
////        let arrowLine = annotation.overlapsSelf
////            ? "L \(width + 10),\(height / 2) L \(width),\(height / 2)"
////            : ""
//
//        // 根据 rangeType 决定路径
//        if rangeType == "middle" {
//            path.move(to: CGPoint(x: 0, y: 0))
//            path.addLine(to: CGPoint(x: width - pointiness / 2, y: 0))
//            path.addQuadCurve(to: CGPoint(x: width + pointiness / 2, y: height / 2), control: CGPoint(x: width + pointiness / 2, y: height / 2))
//            path.addLine(to: CGPoint(x: width - pointiness / 2, y: height))
//            path.addLine(to: CGPoint(x: 0, y: height))
//            path.addQuadCurve(to: CGPoint(x: pointiness, y: height / 2), control: CGPoint(x: pointiness, y: height / 2))
//            path.addLine(to: CGPoint(x: 0, y: 0))
//        } else if rangeType == "start" {
//            path.move(to: CGPoint(x: 0, y: 0))
//            path.addLine(to: CGPoint(x: width - pointiness / 2, y: 0))
//            path.addQuadCurve(to: CGPoint(x: width + pointiness / 2, y: height / 2), control: CGPoint(x: width + pointiness / 2, y: height / 2))
//            path.addLine(to: CGPoint(x: width - pointiness / 2, y: height))
//            path.addLine(to: CGPoint(x: 0, y: height))
//            path.addLine(to: CGPoint(x: width + 10, y: height / 2))
//            path.addLine(to: CGPoint(x: width, y: height / 2))
//        } else if rangeType == "beginningAndEnd" {
//            path.move(to: CGPoint(x: 0, y: 0))
//            path.addLine(to: CGPoint(x: widthMinusOne, y: 0))
//            path.addLine(to: CGPoint(x: width, y: height / 2))
//            path.addLine(to: CGPoint(x: widthMinusOne, y: height))
//            path.addLine(to: CGPoint(x: 0, y: height))
//            path.addLine(to: CGPoint(x: 0, y: 0))
//        } else {
//            path.move(to: CGPoint(x: 0, y: 0))
//            path.addLine(to: CGPoint(x: widthMinusOne, y: 0))
//            path.addLine(to: CGPoint(x: width, y: height / 2))
//            path.addLine(to: CGPoint(x: widthMinusOne, y: height))
//            path.addLine(to: CGPoint(x: 0, y: height))
//            path.addQuadCurve(to: CGPoint(x: pointiness, y: height / 2), control: CGPoint(x: pointiness, y: height / 2))
//            path.addLine(to: CGPoint(x: 0, y: 0))
//        }
//        path.closeSubpath()
//        return path
//    }
//
//
//    private var textOffset: CGFloat {
//        let nameToDisplay = customName ?? name
//        var offset: CGFloat = width / 2 - (CGFloat(nameToDisplay.count) * 5) / 2
//        
//        if !doesLabelFitInAnnotation(name, width: width, charWidth: charWidth) {
//            if truncateLabelsThatDoNotFit {
//                // 计算可以显示的字符数量
//                let fractionToDisplay = width / (CGFloat(name.count) * 10)
//                let numLetters = Int(fractionToDisplay * CGFloat(name.count))
//                let truncatedName = name.prefix(numLetters) + "..."
//                // 计算截断后的文本偏移量
//                offset = CGFloat(Int(width) / 2 - (truncatedName.count * 5) / 2)
//            } else {
//                offset = 0
//            }
//        }
//        
//        return offset
//    }
//
//
//    var body: some View {
//        // 直接使用 Path 对象来绘制路径
//        Path { path in
//            let pathData = self.path // Ensure this is of type Path, not String
//            path.addPath(pathData)
//        }
//        .fill(color)
//        .frame(width: width, height: height)
//        .onTapGesture {
//            onClick()
//        }
//        .onLongPressGesture {
//            onDoubleClick()
//        }
//        .contextMenu {
//            Button(action: onRightClick) {
//                Text("Right-click Action")
//            }
//        }
//
//
//        if isStriped {
//            getStripedPattern(color: color)
//        }
//
//    }
//
//    private func getStripedPattern(color: Color) -> some View {
//        // 使用渐变模拟图案
//        return Rectangle()
//            .fill(LinearGradient(
//                gradient: Gradient(colors: [color.opacity(0.2), color]),
//                startPoint: .topLeading,
//                endPoint: .bottomTrailing
//            ))
//            .strokeBorder(Color.white, lineWidth: 2)
//            .rotationEffect(.degrees(45))
//    }
//
//    private func getAnnotationClassnames(
//        _ annotation: Annotation,
//        isProtein: Bool,
//        type: String
//    ) -> String {
//        return "\(type)-annotation \(isProtein ? "protein" : "")"
//    }
//
//    private func doesLabelFitInAnnotation(
//        _ name: String,
//        width: CGFloat,
//        charWidth: CGFloat
//    ) -> Bool {
//        // 将name.count转为CGFloat
//        let textWidth = CGFloat(name.count) * charWidth
//        return textWidth <= width
//    }
//
//}
//
//struct PointedAnnotation_Previews: PreviewProvider {
//    static var previews: some View {
//        PointedAnnotation(
//            className: "test-class",
//            widthInBps: 100,
//            charWidth: 10,
//            height: 20,
//            rangeType: "start",
//            forward: true,
//            arrowheadType: "arrow",
//            name: "Annotation",
//            type: "Feature",
//            readOnly: false,
//            isStriped: false,
//            isProtein: true,
//            id: "12345",
//            extraHeight: 10,
//            flipAnnotation: false,
//            insertPaths: "path data",
//            insertTicks: "tick data",
//            hideName: false,
//            color: .orange,
//            opacity: 1.0,
//            onClick: {},
//            onDoubleClick: {},
//            onRightClick: {},
//            gapsInside: 0,
//            gapsBefore: 0,
//            annotation: Annotation(position: 10),
//            truncateLabelsThatDoNotFit: true,
//            onlyShowLabelsThatDoNotFit: false
//        )
//    }
//}
