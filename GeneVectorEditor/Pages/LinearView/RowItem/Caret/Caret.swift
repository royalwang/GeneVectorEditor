////
////  Caret.swift
////  GeneVectorEditor
////
////  Created by Wang Zhengdong on 1/13/25.
////
//
//
//import SwiftUI
//
//struct Caret: View {
//    var charWidth: CGFloat
//    var row: Row
//    var sequenceLength: Int
//    var caretPosition: Int
//    var isProtein: Bool
//    var onClick: () -> Void
//    var isDraggable: Bool
//    var leftMargin: CGFloat = 0
//    var onRightClick: (() -> Void)?
//    var style: [String: Any] = [:]
//    var selectionMessage: String?
//    var className: String = ""
//
//    var body: some View {
//        if shouldShowCaret() {
//            return AnyView(
//                GeometryReader { geometry in
//                    ZStack {
//                        Rectangle()
//                            .fill(Color.clear) // Invisible to create space for Caret
//                            .frame(width: 0, height: geometry.size.height)
//
//                        Button(action: onClick) {
//                            Text(selectionMessage ?? getSelectionMessage())
//                                .padding(0)
//                                .background(Color.clear)
//                                .frame(width: 0, height: geometry.size.height)
//                        }
//                        .frame(width: 0, height: geometry.size.height)
//                        .position(
//                            x: leftMargin + CGFloat(caretPosition - row.start) * charWidth - 2,
//                            y: geometry.size.height / 2
//                        )
//                        .foregroundColor(.blue) // Customize as needed
//                        .opacity(isDraggable ? 1.0 : 0.5) // "notClickable" equivalent
//                    }
//                }
//            )
//        } else {
//            return AnyView(EmptyView()) // No caret if the condition is not met
//        }
//    }
//
//    // Helper function to check if the caret should be displayed
//    func shouldShowCaret() -> Bool {
//        return (row.start <= caretPosition && row.end + 1 >= caretPosition) ||
//            (row.end == sequenceLength - 1 && row.end < caretPosition)
//    }
//
//    // Function to generate the selection message
//    func getSelectionMessage() -> String {
//        return "Caret is at position: \(caretPosition)"
//    }
//}
//
//
//
//struct Caret_Previews: PreviewProvider {
//    static var previews: some View {
//        Caret(
//            charWidth: 10,
//            row: Row(start: 5, end: 10),
//            sequenceLength: 100,
//            caretPosition: 7,
//            isProtein: false,
//            onClick: {},
//            isDraggable: true
//        )
//        .frame(width: 300, height: 20)
//    }
//}
