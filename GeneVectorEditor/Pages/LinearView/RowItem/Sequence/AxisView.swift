//
//  AxisView.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/14/25.
//


import SwiftUI

struct AxisView: View {
    let tickSpacing: Int
    let sequenceLength: Int
    let charWidth: CGFloat
    let horizontalPadding: CGFloat // 横向空白间距
    
    var body: some View {
        VStack(spacing: 0) {
            // 添加水平轴线
            HStack {
                Spacer().frame(width: horizontalPadding) // 左边空白
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.black)
                    .offset(y: 0) // 让线位于刻度线的上方
                Spacer().frame(width: horizontalPadding) // 右边空白
            }
            
            // 绘制刻度和刻度标签
            HStack(spacing: 0) {
                Spacer().frame(width: horizontalPadding) // 左边空白
                
                ForEach(1..<sequenceLength, id: \.self) { index in
                    if index % tickSpacing == 0 {
                        VStack(spacing: 0) {
                            Rectangle()
                                .frame(width: 1, height: 10) // 刻度线
                                .foregroundColor(.black)
                            Text("\(index)")
                                .font(.system(size: 10))
                                .frame(width: charWidth, alignment: .center)
                        }
                        .frame(width: charWidth) // 保证每个字符占用相同的宽度
                    } else {
                        Spacer().frame(width: charWidth)
                    }
                }
                
                Spacer().frame(width: horizontalPadding) // 右边空白
            }
        }
    }
}

struct AxisView_ContentView: View {
    var body: some View {
        VStack {
            AxisView(
                tickSpacing: 10,
                sequenceLength: 100,
                charWidth: 14,
                horizontalPadding: 20
            )
            .frame(height: 20)
        }
        .padding()
    }
}
