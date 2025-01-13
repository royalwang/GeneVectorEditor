//
//  SelectionLayer.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/13/25.
//

import SwiftUI

struct SelectionLayer: View {
    var charWidth: CGFloat
    var isDraggable: Bool
    var row: Range<Int>
    var sequenceLength: Int
    var regions: [SelectionLayerRegion]
    var leftMargin: CGFloat = 0
    var isProtein: Bool
    var getGaps: (Int) -> GapInfo
    var hideTitle: Bool
    var customTitle: String?
    var color: Color
    var hideCarets: Bool
    var selectionLayerRightClicked: ((SelectionLayerRegion) -> Void)?
    var className: String = ""
    var onClick: ((SelectionLayerRegion) -> Void)?

    var body: some View {
        VStack {
            // Ensure you are passing an array to ForEach
            ForEach(regions, id: \.id) { selectionLayer in
                let selectionMessage = hideTitle ? "" : getSelectionMessage(for: selectionLayer)
                
                if selectionLayer.start > -1 {
                    let overlaps = getOverlapsOfPotentiallyCircularRanges(for: selectionLayer)
                    
                    if !overlaps.isEmpty {
                        ForEach(overlaps, id: \.self) { overlap in
                            let xStart = getXStartAndWidth(for: overlap).xStart
                            let width = getXStartAndWidth(for: overlap).width
                            
                            // Carets
                            let caretSvgs: [AnyView] = [
                                isCaretsVisible(for: overlap, start: selectionLayer.start) ? AnyView(
                                    CaretView(
                                        caretPosition: overlap.lowerBound,
                                        leftMargin: leftMargin,
                                        isDraggable: isDraggable,
                                        row: row,
                                        charWidth: charWidth,
                                        onClick: onClick,
                                        onRightClick: selectionLayerRightClicked
                                    )
                                ) : AnyView(EmptyView()),
                                
                                isCaretsVisible(for: overlap, start: selectionLayer.end) ? AnyView(
                                    CaretView(
                                        caretPosition: overlap.upperBound + 1,
                                        leftMargin: leftMargin,
                                        isDraggable: isDraggable,
                                        row: row,
                                        charWidth: charWidth,
                                        onClick: onClick,
                                        onRightClick: selectionLayerRightClicked
                                    )
                                ) : AnyView(EmptyView())
                            ]
                            
                            SelectionRegionView(
                                selectionLayer: selectionLayer,
                                overlap: overlap,
                                xStart: xStart,
                                width: width,
                                leftMargin: leftMargin,
                                color: color,
                                selectionMessage: selectionMessage,
                                caretSvgs: caretSvgs,
                                onClick: onClick
                            )
                        }
                    }
                }
            }
        }
    }

    // Helper to check if carets should be visible
    private func isCaretsVisible(for overlap: Range<Int>, start: Int) -> Bool {
        return overlap.lowerBound == start
    }
    
    // Helper to generate message for selection
    private func getSelectionMessage(for selectionLayer: SelectionLayerRegion) -> String {
        return selectionLayer.customTitle ?? "Custom Title"
    }
    
    private func getXStartAndWidth(for overlap: Range<Int>) -> (xStart: CGFloat, width: CGFloat) {
        let xStart = CGFloat(overlap.lowerBound) * charWidth
        let width = CGFloat(overlap.count) * charWidth
        return (xStart, width)
    }

    private func getOverlapsOfPotentiallyCircularRanges(for selectionLayer: SelectionLayerRegion) -> [Range<Int>] {
        return [selectionLayer.start..<selectionLayer.end]
    }
}

struct SelectionLayerRegion: Hashable, Identifiable {
    var id: UUID = UUID() // Conform to Identifiable
    var start: Int
    var end: Int
    var color: Color
    var customTitle: String?
    var hideTitle: Bool
    var hideCarets: Bool
}

struct CaretView: View {
    var caretPosition: Int
    var leftMargin: CGFloat
    var isDraggable: Bool
    var row: Range<Int>
    var charWidth: CGFloat
    var onClick: ((SelectionLayerRegion) -> Void)?
    var onRightClick: ((SelectionLayerRegion) -> Void)?

    var body: some View {
        Rectangle()
            .fill(Color.blue)
            .frame(width: 10, height: 20)
            .position(x: leftMargin + CGFloat(caretPosition) * charWidth, y: 10)
            .gesture(
                TapGesture().onEnded {
                    // When caret is clicked, call onClick callback with the selected region
                    onClick?(SelectionLayerRegion(start: caretPosition, end: caretPosition, color: .blue, customTitle: nil, hideTitle: false, hideCarets: false))
                }
            )
            .onLongPressGesture {
                // When caret is long-pressed, call onRightClick callback with the selected region
                onRightClick?(SelectionLayerRegion(start: caretPosition, end: caretPosition, color: .blue, customTitle: nil, hideTitle: false, hideCarets: false))
            }
    }
}

struct SelectionRegionView: View {
    var selectionLayer: SelectionLayerRegion
    var overlap: Range<Int>
    var xStart: CGFloat
    var width: CGFloat
    var leftMargin: CGFloat
    var color: Color
    var selectionMessage: String
    var caretSvgs: [AnyView]
    var onClick: ((SelectionLayerRegion) -> Void)?

    var body: some View {
        ZStack {
            Rectangle()
                .fill(color)
                .frame(width: width, height: 20)
                .position(x: leftMargin + xStart + width / 2, y: 10)
                .onTapGesture {
                    onClick?(selectionLayer)
                }
            ForEach(caretSvgs.indices, id: \.self) { index in
                caretSvgs[index]
            }
        }
    }
}

struct SelectionLayerPreview: PreviewProvider {
    static var previews: some View {
        SelectionLayer(
            charWidth: 10,
            isDraggable: true,
            row: 0..<100,
            sequenceLength: 100,
            regions: [
                SelectionLayerRegion(start: 5, end: 10, color: .red, customTitle: "Selection 1", hideTitle: false, hideCarets: false),
                SelectionLayerRegion(start: 15, end: 25, color: .green, customTitle: "Selection 2", hideTitle: false, hideCarets: false)
            ],
            leftMargin: 10,
            isProtein: true,
            getGaps: { _ in GapInfo(gapsBefore: 0) },
            hideTitle: false,
            customTitle: "Custom Selection Layer",
            color: .blue,
            hideCarets: false,
            selectionLayerRightClicked: { _ in print("Right-clicked selection layer") },
            onClick: { _ in print("Clicked selection layer") }
        )
    }
}

struct GapInfo {
    var gapsBefore: Int
}
