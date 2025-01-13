//
//  ZoomLinearView.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/13/25.
//

import SwiftUI

// 常量定义，控制滑块的宽度
let SLIDER_NORM_WIDTH: CGFloat = 200
let SLIDER_SMALL_WIDTH: CGFloat = 150

// ZoomLinearView 组件
struct ZoomLinearView: View {
    @Binding var charWidth: CGFloat  // 绑定的字符宽度，供外部修改
    var minCharWidth: CGFloat
    var bindOutsideChangeHelper: Any?  // 占位符，因为没有上下文无法处理
    var afterOnChange: (() -> Void)?  // 缩放后回调
    var smallSlider: Bool
    
    @State private var zoomLevel: Double = 0.0  // 缩放级别，滑块的值
    
    // 计算新的字符宽度
    func zoomChanged(to zoomLvl: Double) {
        // 基于原始代码的缩放因子计算
        let scaleFactor = pow(12 / minCharWidth, 1 / 10)
        let newCharWidth = minCharWidth * pow(scaleFactor, zoomLvl)
        charWidth = newCharWidth
        afterOnChange?()
        scrollToCaret()  // 缩放后滚动到焦点
    }
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    // 减少缩放级别
                    if zoomLevel > 0 {
                        zoomLevel -= 1
                        zoomChanged(to: zoomLevel)
                    }
                }) {
                    Image(systemName: "minus.circle.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                
                Slider(
                    value: $zoomLevel,
                    in: 0...10,
                    step: 0.05,
                    onEditingChanged: { _ in
                        zoomChanged(to: zoomLevel)
                    }
                )
                .frame(width: smallSlider ? SLIDER_SMALL_WIDTH : SLIDER_NORM_WIDTH)
                .padding(.horizontal)
                
                Button(action: {
                    // 增加缩放级别
                    if zoomLevel < 10 {
                        zoomLevel += 1
                        zoomChanged(to: zoomLevel)
                    }
                }) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
            }
            .padding(.top, 4)
            .frame(width: smallSlider ? SLIDER_SMALL_WIDTH : SLIDER_NORM_WIDTH)
        }
        .padding(5)
        .background(Color.white.opacity(0.9))
        .cornerRadius(8)
        .shadow(radius: 4)
    }
}

struct ZoomLinearView_Previews: PreviewProvider {
    static var previews: some View {
        ZoomLinearView(
            charWidth: .constant(10),
            minCharWidth: 5,
            bindOutsideChangeHelper: nil,
            afterOnChange: nil,
            smallSlider: false
        )
        .frame(width: 300, height: 100)
    }
}

// 占位符函数，模拟滚动到焦点的行为
func scrollToCaret() {
    print("缩放后滚动到焦点...")
}
