////
////  AxisView 2.swift
////  GeneVectorEditor
////
////  Created by Wang Zhengdong on 1/14/25.
////
//
//
//import SwiftUI
//
//struct AxisView: View {
//    let tickSpacing: Int
//    let sequenceLength: Int
//    let charWidth: CGFloat
//
//    var body: some View {
//        ZStack(alignment: .topLeading) {
//            // 添加水平轴线
//            Rectangle()
//                .frame(height: 1)
//                .foregroundColor(.black)
//                .offset(y: 0) // 让线位于刻度线的上方
//
//            // 绘制刻度和刻度标签
//            HStack(spacing: 0) {
//                ForEach(0..<sequenceLength, id: \.self) { index in
//                    VStack(spacing: 0) {
//                        if index % tickSpacing == 0 {
//                            Rectangle()
//                                .frame(width: 1, height: 10) // 刻度线
//                                .foregroundColor(.black)
//                            Text("\(index)")
//                                .font(.system(size: 10))
//                                .frame(width: charWidth, alignment: .center)
//                        } else {
//                            Spacer().frame(width: charWidth)
//                        }
//                    }
//                    .frame(width: charWidth) // 保证每个字符占用相同的宽度
//                }
//            }
//        }
//    }
//}
//
//struct AxisView_ContentView: View {
//    var body: some View {
//        VStack {
//            Text("5' attatcatgacattaacctataaaaataggcgtatcacgaggccctttcgtcttcaagaattcccgacaccatcgaatggtgcaaaa 3'")
//                .font(.system(size: 14))
//                .monospaced() // 保持字符间距一致
//                .padding(.bottom, 10)
//
//            AxisView(
//                tickSpacing: 10,
//                sequenceLength: 100,
//                charWidth: 10
//            )
//            .frame(height: 20)
//        }
//        .padding()
//    }
//}
