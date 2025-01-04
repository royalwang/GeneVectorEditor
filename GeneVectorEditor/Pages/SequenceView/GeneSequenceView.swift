//
//  GeneSequenceView.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/4/25.
//


import SwiftUI

struct GeneSequenceView: View {
    let sequence: String // 完整核酸序列
    let lineLength: Int // 每行显示的碱基数
    let scaleStep: Int = 10 // 坐标刻度的步长

    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 10) {
                // 将序列切分为多行
                ForEach(0..<(sequence.count / lineLength + 1), id: \.self) { lineIndex in
                    let startIndex = sequence.index(sequence.startIndex, offsetBy: lineIndex * lineLength)
                    let endIndex = sequence.index(startIndex, offsetBy: lineLength, limitedBy: sequence.endIndex) ?? sequence.endIndex
                    
                    if startIndex < endIndex { // 防止超出范围
                        let lineSequence = String(sequence[startIndex..<endIndex])
                        SequenceLineView(sequence: lineSequence, startOffset: lineIndex * lineLength, scaleStep: scaleStep)
                    }
                }
            }
            .padding()
        }
    }
}

struct SequenceLineView: View {
    let sequence: String // 当前行的序列
    let startOffset: Int // 当前行的起始坐标
    let scaleStep: Int // 坐标步长

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            // 坐标轴
            HStack(spacing: 0) {
                ForEach(0..<sequence.count / scaleStep + 1, id: \.self) { index in
                    let position = startOffset + index * scaleStep
                    Text("\(position)")
                        .font(.custom("Courier", size: 14)) // 等宽字体
                        .foregroundColor(.gray)
                        .frame(width: 8 * CGFloat(scaleStep), alignment: .leading) // 确保对齐
                }
            }

            // 序列显示
            ColoredSequenceView(sequence: sequence)
//                .font(.custom("Courier", size: 14)) // 等宽字体
//                .lineSpacing(5)
        }
    }
}

struct ColoredSequenceView: View {
    let sequence: String
    let chunkSize: Int = 10 // 每 10 个字符分块
    let colors: [Color] = [.blue, .green, .orange, .red, .purple] // 循环使用的颜色

    var body: some View {
        // 将序列分块后显示
        HStack(spacing: 0) {
            ForEach(0..<sequenceChunks.count, id: \.self) { index in
                Text(sequenceChunks[index])
                    .font(.custom("Courier", size: 14)) // 等宽字体
                    .foregroundColor(colors[index % colors.count]) // 循环分配颜色
            }
        }
        .lineSpacing(5) // 设置行间距
    }

    // 计算属性：将序列按 chunkSize 分割成数组
    private var sequenceChunks: [String] {
        stride(from: 0, to: sequence.count, by: chunkSize).map { startIndex in
            let endIndex = min(startIndex + chunkSize, sequence.count)
            let range = sequence.index(sequence.startIndex, offsetBy: startIndex)..<sequence.index(sequence.startIndex, offsetBy: endIndex)
            return String(sequence[range])
        }
    }
}

//struct GeneSequenceView: View {
//    let sequence: String // 核酸序列
//    let scaleStep: Int = 10 // 坐标刻度的步长
//
//    var body: some View {
//        ScrollView(.vertical) {
//            VStack(alignment: .leading, spacing: 5) {
//                // 坐标刻度
//                SequenceAxis(sequenceLength: sequence.count, scaleStep: scaleStep)
//                    .padding(.bottom, 5)
//
//                // 序列显示
//                Text(sequence)
//                    .font(.custom("Courier", size: 14)) // 使用等宽字体
//                    .lineSpacing(5)
//                    .fixedSize(horizontal: true, vertical: false) // 防止自动换行
//            }
//            .padding()
//        }
//    }
//}
//
//struct SequenceAxis: View {
//    let sequenceLength: Int
//    let scaleStep: Int
//
//    var body: some View {
//        HStack(spacing: 0) {
//            ForEach(0...sequenceLength / scaleStep, id: \.self) { index in
//                let position = index * scaleStep
//                Text("\(position)")
//                    .font(.custom("Courier", size: 14)) // 确保与序列字体匹配
//                    .foregroundColor(.gray)
//                    .frame(width: 8 * CGFloat(scaleStep), alignment: .leading) // 每个刻度宽度与序列一致
//            }
//        }
//    }
//}

//struct GeneSequenceView: View {
//    let sequence: String
//    let features: [GeneFeature2]
//
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading, spacing: 20) {
//                // 坐标轴
//                SequenceAxis(length: sequence.count)
//
//                // 基因功能区域
////                ForEach(features) { feature in
////                    GeneFeatureView(feature: feature, sequenceLength: sequence.count)
////                }
//
//                // 核酸序列
//                Text(sequence)
//                    .font(.custom("Courier", size: 14)) // 使用等宽字体
//                    .lineSpacing(5)
//                    .padding(.top, 10)
//            }
//            .padding()
//        }
//    }
//}
//
//// 序列坐标轴
//struct SequenceAxis: View {
//    let length: Int
//
//    var body: some View {
//        HStack(spacing: 5) {
//            ForEach(0..<length / 10 + 1, id: \.self) { index in
//                Text("\(index * 10)")
//                    .font(.caption)
//                    .foregroundColor(.gray)
//            }
//        }
//    }
//}

// 基因功能区域视图
struct GeneFeatureView: View {
    let feature: GeneFeature2
    let sequenceLength: Int

    var body: some View {
        HStack(spacing: 5) {
            // 左侧 Spacer 根据起始位置动态缩放
            Spacer(minLength: CGFloat(feature.start) / CGFloat(sequenceLength) * UIScreen.main.bounds.width)

            ZStack {
                Rectangle()
                    .fill(feature.color) // 使用 Color 类型
                    .frame(height: 30)
                HStack {
                    if feature.direction == .reverse {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.white)
                            .padding(.leading, 5)
                    }
                    Text(feature.name)
                        .foregroundColor(.white)
                        .font(.caption)
                        .fontWeight(.bold)
                    if feature.direction == .forward {
                        Image(systemName: "arrow.right")
                            .foregroundColor(.white)
                            .padding(.trailing, 5)
                    }
                }
            }
            .frame(width: CGFloat(feature.end - feature.start) / CGFloat(sequenceLength) * UIScreen.main.bounds.width)

            // 右侧 Spacer 根据结束位置动态缩放
            Spacer(minLength: CGFloat(sequenceLength - feature.end) / CGFloat(sequenceLength) * UIScreen.main.bounds.width)
        }
    }
}


struct GeneFeature2: Identifiable {
    let id = UUID()
    let name: String
    let start: Int
    let end: Int
    let color: Color // 确保是 Color 类型
    let direction: Direction
}

enum Direction {
    case forward
    case reverse
}



//struct GeneSequenceView_Previews: PreviewProvider {
//    static var previews: some View {
//        GeneSequenceView(
//            sequence: "aattccggttccggttggccaattggcctaattccggaattccggttccggttggccaattggcctaat"
////            features: [
////                GeneFeature2(name: "pBRforEco", start: 10, end: 40, color: .green, direction: .forward),
////                GeneFeature2(name: "lacIq promoter", start: 50, end: 80, color: .blue, direction: .reverse),
////                GeneFeature2(name: "synthetic DNA", start: 90, end: 130, color: .purple, direction: .forward)
////            ]
//        )
//            .preferredColorScheme(.light)
//    }
//}
