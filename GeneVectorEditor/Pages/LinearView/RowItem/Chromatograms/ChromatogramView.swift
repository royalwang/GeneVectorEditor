//
//  ChromatogramView.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/13/25.
//

import SwiftUI

struct ChromatogramView: View {
    @State private var scalePct: CGFloat = 0.05
    @State private var hasDrawnOnce: Bool = false
    
    let isRowView: Bool
    let chromatogramData: ChromatogramData?
    let row: Row
    let getGaps: (Int) -> GapData
    let charWidth: CGFloat
    
    private var gapsBeforeRow: Int {
        getGaps(row.start).gapsBefore
    }
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    scalePct += 0.01
                }) {
                    Image(systemName: "chevron.up")
                        .foregroundColor(.blue)
                }
                .padding()
                .popover(isPresented: .constant(true)) {
                    Text("Scale Chromatogram Up")
                        .padding()
                }
                
                
                Button(action: {
                    scalePct -= 0.01
                }) {
                    Image(systemName: "chevron.down")
                        .foregroundColor(.blue)
                }
                .padding()
                .popover(isPresented: .constant(true)) {
                    Text("Scale Chromatogram Down")
                        .padding()
                }
                
            }
            .zIndex(10)
            
            ChromatogramCanvas(
                chromatogramData: chromatogramData,
                scalePct: scalePct,
                row: row,
                charWidth: charWidth,
                getGaps: getGaps,
                isRowView: isRowView,
                gapsBeforeRow: gapsBeforeRow,
                showChromQualScores: true
            )
            .contextMenu {
                Button("Show Chromatogram Menu") {
                    // Handle context menu action
                }
            }
        }
        .padding()
    }
}

struct ChromatogramCanvas: View {
    let chromatogramData: ChromatogramData?
    let scalePct: CGFloat
    let row: Row
    let charWidth: CGFloat
    let getGaps: (Int) -> GapData
    let isRowView: Bool
    
    @State private var gapsBeforeRow: Int
    
    @State private var showChromQualScores: Bool = true
    
    init(chromatogramData: ChromatogramData?, scalePct: CGFloat, row: Row, charWidth: CGFloat, getGaps: @escaping (Int) -> GapData, isRowView: Bool, gapsBeforeRow: Int, showChromQualScores: Bool) {
        self.chromatogramData = chromatogramData
        self.scalePct = scalePct
        self.row = row
        self.charWidth = charWidth
        self.getGaps = getGaps
        self.isRowView = isRowView
        self.gapsBeforeRow = gapsBeforeRow
        self.showChromQualScores = showChromQualScores
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Canvas { context, size in
                    if let chromatogramData = chromatogramData {
                        drawCanvas(
                            context: context,
                            size: size,
                            chromatogramData: chromatogramData
                        )
                    }
                }
                .frame(width: calculateCanvasWidth(), height: 100)
            }
        }
    }
    
    func calculateCanvasWidth() -> CGFloat {
        let seqLengthWithGaps = row.end - row.start + 1 + getGaps(row.end).gapsBefore - gapsBeforeRow
        return CGFloat(seqLengthWithGaps) * charWidth
    }
    
    func drawCanvas(context: GraphicsContext, size: CGSize, chromatogramData: ChromatogramData) {
        let colors = [
            "adenine": Color.green,
            "thymine": Color.red,
            "guanine": Color.black,
            "cytosine": Color.blue,
            "other": Color.purple
        ]
        
        let maxHeight = size.height
        let seqLengthWithGaps = row.end - row.start + 1 + getGaps(row.end).gapsBefore - gapsBeforeRow
        let scaledHeight = maxHeight
        
        func drawPeaks(traceType: String, lineColor: Color) {
            let traceData = chromatogramData.baseTraces
            for baseIndex in row.start...row.end {
                if let traceAtBaseIndex = traceData[baseIndex],
                   let traceForIndex = traceAtBaseIndex[traceType] {
                    // Now you can safely use 'traceForIndex'
                    // Do something with traceForIndex
                    let gapsAt = getGaps(baseIndex).gapsBefore
                    let startXPosition = CGFloat(baseIndex + gapsAt - row.start - gapsBeforeRow) * charWidth
                    
                    let traceLength = traceForIndex.count
                    let tracePointSpacing = charWidth / CGFloat(traceLength)
                    for (index, tracePoint) in traceForIndex.enumerated() {
                        let scaledTracePoint = scaledHeight - scalePct * CGFloat(tracePoint)
                        context.stroke(
                            Path { path in
                                path.move(to: CGPoint(x: startXPosition + tracePointSpacing * CGFloat(index), y: scaledTracePoint))
                            },
                            with: .color(lineColor)
                        )
                    }
                } else {
                    // Handle the case where data is missing or incorrect
                    print("No trace data found for baseIndex: \(baseIndex) and traceType: \(traceType)")
                }
            }
        }
        
        func drawQualityScoreHistogram() {
            guard let qualNums = chromatogramData.qualNums, showChromQualScores else { return }
            let qualMax = qualNums.max() ?? 0
            let scalePctQual = scaledHeight / CGFloat(qualMax)
            
            for baseIndex in row.start...row.end {
                let gapsAt = getGaps(baseIndex).gapsBefore
                let startXPosition = CGFloat(baseIndex + gapsAt - row.start - gapsBeforeRow) * charWidth
                context.fill(
                    Path { path in
                        path.addRect(CGRect(
                            x: startXPosition,
                            y: scaledHeight - CGFloat(qualNums[baseIndex]) * scalePctQual,
                            width: charWidth,
                            height: CGFloat(qualNums[baseIndex]) * scalePctQual
                        ))
                    },
                    with: .color(Color.gray)
                )
            }
        }
        
        drawQualityScoreHistogram()
        drawPeaks(traceType: "aTrace", lineColor: colors["adenine"] ?? Color.green)
        drawPeaks(traceType: "tTrace", lineColor: colors["thymine"] ?? Color.red)
        drawPeaks(traceType: "gTrace", lineColor: colors["guanine"] ?? Color.black)
        drawPeaks(traceType: "cTrace", lineColor: colors["cytosine"] ?? Color.blue)
    }
}

struct ChromatogramData {
    var baseTraces: [Int: [String: [Int]]]
    var qualNums: [Int]?
}

struct GapData {
    var gapsBefore: Int
}

struct ChromatogramView_Previews: PreviewProvider {
    static var previews: some View {
        ChromatogramView(
            isRowView: true,
            chromatogramData: ChromatogramData(baseTraces: [:], qualNums: [10, 20, 30]),
            row: Row(start: 0, end: 10),
            getGaps: { _ in GapData(gapsBefore: 0) },
            charWidth: 10
        )
        .frame(width: 400, height: 200)
    }
}
