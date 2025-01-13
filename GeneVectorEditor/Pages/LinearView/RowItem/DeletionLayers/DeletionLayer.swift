//
//  DeletionLayer.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/13/25.
//

import SwiftUI

struct DeletionLayer: Identifiable {
    var id = UUID()
    var start: Int
    var end: Int
    var color: Color
    var inBetweenBps: Bool
}

struct DeletionLayersView: View {
    var charWidth: CGFloat
    var row: Range<Int>
    var sequenceLength: Int
    var deletionLayers: [DeletionLayer]
    var deletionLineHeight: CGFloat = 6
    var deletionLayerClicked: (DeletionLayer) -> Void
    var deletionLayerRightClicked: (DeletionLayer) -> Void

    var body: some View {
        // 筛选并排序删除区间
        let deletionLayersToUse = deletionLayers.sorted { (layer1, layer2) -> Bool in
            return layer1.inBetweenBps ? true : false
        }
        
        // 如果没有删除区间则不渲染
        if deletionLayersToUse.isEmpty {
            return AnyView(EmptyView())
        }
        
        return AnyView(
            VStack {
                ForEach(deletionLayersToUse) { deletionLayer in
                    // 计算区间重叠
                    let overlaps = getOverlaps(deletionLayer: deletionLayer)
                    ForEach(overlaps, id: \.self) { overlap in
                        let xStart = getXStart(for: overlap)
                        let width = getWidth(for: overlap)
                        
                        // 绘制删除区域
                        ZStack(alignment: .leading) {
                            // 删除区间矩形
                            Rectangle()
                                .fill(deletionLayer.color)
                                .frame(width: width, height: deletionLineHeight)
                                .position(x: xStart + (deletionLayer.inBetweenBps ? charWidth / 1.2 : 0), y: deletionLineHeight / 2)
                                .onTapGesture {
                                    deletionLayerClicked(deletionLayer)
                                }
                                .onLongPressGesture {
                                    deletionLayerRightClicked(deletionLayer)
                                }
                            
                            // 如果删除区间跨越序列，绘制开始和结束的标记
                            if isRangeSpansSequence(deletionLayer: deletionLayer, overlap: overlap) {
                                if overlap.lowerBound == deletionLayer.start {
                                    Rectangle()
                                        .fill(Color.blue)
                                        .frame(width: 4, height: deletionLineHeight)
                                        .position(x: xStart, y: deletionLineHeight / 2)
                                }
                                if overlap.upperBound == deletionLayer.end {
                                    Rectangle()
                                        .fill(Color.blue)
                                        .frame(width: 4, height: deletionLineHeight)
                                        .position(x: xStart + width - 4, y: deletionLineHeight / 2)
                                }
                            }
                        }
                    }
                }
            }
        )
    }
    
    // 根据重叠区域和序列计算重叠区间
    private func getOverlaps(deletionLayer: DeletionLayer) -> [Range<Int>] {
        // 需要实现获取可能重叠区间的逻辑
        return [deletionLayer.start..<deletionLayer.end]
    }

    // 获取删除区间的起始坐标
    private func getXStart(for overlap: Range<Int>) -> CGFloat {
        // 计算删除区间的起始位置
        return CGFloat(overlap.lowerBound) * charWidth
    }
    
    // 获取删除区间的宽度
    private func getWidth(for overlap: Range<Int>) -> CGFloat {
        // 计算删除区间的宽度
        return CGFloat(overlap.count) * charWidth
    }

    // 判断删除区间是否跨越整个序列
    private func isRangeSpansSequence(deletionLayer: DeletionLayer, overlap: Range<Int>) -> Bool {
        return (deletionLayer.start == 0 && deletionLayer.end == sequenceLength - 1)
    }
}

struct DeletionLayersView_ContentView: View {
    let deletionLayers: [DeletionLayer] = [
        DeletionLayer(start: 5, end: 10, color: .red, inBetweenBps: false),
        DeletionLayer(start: 20, end: 25, color: .green, inBetweenBps: true),
        DeletionLayer(start: 30, end: 35, color: .blue, inBetweenBps: false)
    ]
    
    var body: some View {
        DeletionLayersView(
            charWidth: 10,
            row: 0..<100,
            sequenceLength: 100,
            deletionLayers: deletionLayers,
            deletionLayerClicked: { layer in
                print("Clicked deletion layer: \(layer)")
            },
            deletionLayerRightClicked: { layer in
                print("Right-clicked deletion layer: \(layer)")
            }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DeletionLayersView_ContentView()
    }
}
