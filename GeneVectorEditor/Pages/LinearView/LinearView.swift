//
//  SequenceData.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/13/25.
//


import SwiftUI

// 定义一些辅助函数和常量
let defaultMarginWidth: CGFloat = 10
let bpsPerRow: Int = 100  // Example length for bps per row

struct LinearView: View {
    @State private var charWidth: CGFloat = 10
    @State private var isZoomed: Bool = false
    @State private var percentScrolled: CGFloat = 0
    @State private var sequenceData: SequenceData
    @State private var caretPosition: Int = 0
    @State private var rowData: [String] = []
    
    var width: CGFloat
    var height: CGFloat
    var marginWidth: CGFloat = defaultMarginWidth
    var editorName: String = ""
    var hideName: Bool = false
    var scrollDataPassed: Bool = false
    
    // Public initializer to allow passing values when creating an instance of LinearView
    public init(sequenceData: SequenceData, width: CGFloat, height: CGFloat, marginWidth: CGFloat = defaultMarginWidth, editorName: String = "", hideName: Bool = false, scrollDataPassed: Bool = false) {
        self._sequenceData = State(initialValue: sequenceData)
        self.width = width
        self.height = height
        self.marginWidth = marginWidth
        self.editorName = editorName
        self.hideName = hideName
        self.scrollDataPassed = scrollDataPassed
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                if !hideName {
                    Text(sequenceData.name ?? "")
                        .font(.headline)
                        .padding(.top)
                }
                
                ZStack {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(rowData, id: \.self) { row in
                                Text(row)
                                    .frame(width: self.charWidth, height: 30)
                                    .background(Color.gray.opacity(0.3))
                                    .border(Color.black)
                            }
                        }
                        .frame(width: width - marginWidth, alignment: .leading)
                        .onChange(of: caretPosition) { _ in
                            scrollToCaret()
                        }
                    }
                    
                    // Pinch Gesture for zooming
                    PinchGestureView(onZoomChanged: { scale in
                        self.charWidth = max(10, min(20, self.charWidth * scale))
                        self.isZoomed = scale != 1.0
                    })
                    
                    // Draggable behavior (like `Draggable` in React)
                    Rectangle()
                        .fill(Color.blue.opacity(0.2))
                        .frame(width: self.width, height: self.height)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    let position = getNearestCursorPosition(from: value.location.x)
                                    caretPosition = position
                                }
                        )
                }
            }
            .frame(width: width, height: height)
            .padding(.horizontal, marginWidth / 2)
            .onAppear {
                self.rowData = generateRowData()
            }
        }
    }
    
    func getNearestCursorPosition(from xPosition: CGFloat) -> Int {
        let maxLength = sequenceData.sequence.count
        let nearestCaretPos = Int(xPosition / charWidth)
        return min(max(nearestCaretPos, 0), maxLength)
    }
    
    func generateRowData() -> [String] {
        // You would likely prepare row data here, depending on the sequence data
        return Array(repeating: "Sample Row", count: bpsPerRow)
    }
    
    func scrollToCaret() {
        // Implement logic to scroll to caret position
        print("Scrolling to caret: \(caretPosition)")
    }
}

struct PinchGestureView: View {
    var onZoomChanged: (CGFloat) -> Void
    
    @GestureState private var scale: CGFloat = 1.0
    
    var body: some View {
        Rectangle()
            .fill(Color.clear)
            .gesture(
                MagnificationGesture()
                    .updating($scale) { value, scale, _ in
                        scale = value
                    }
                    .onEnded { value in
                        self.onZoomChanged(value)
                    }
            )
    }
}

// 预览代码
struct LinearView_Previews: PreviewProvider {
    static var previews: some View {
        LinearView(sequenceData: SequenceData(sequence: "AGCTAGCTAGCT", name: "Sample Sequence", isProtein: false),
                   width: 400, height: 200)
    }
}
