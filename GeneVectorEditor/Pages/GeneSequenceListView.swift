////
////  GeneSequenceListView.swift
////  GeneVectorEditor
////
////  Created by Wang Zhengdong on 1/3/25.
////
//
//
//import SwiftUI
//
//struct GeneSequenceListView: View {
//    // 示例数据
//    @State private var geneFiles = [
//        GeneFile(name: "Gene_Sequence_1.json", size: "2.5 MB", lastModified: "2025-01-03", isCompleted: false),
//        GeneFile(name: "Gene_Sequence_2.json", size: "3.1 MB", lastModified: "2025-01-01", isCompleted: false),
//        GeneFile(name: "Gene_Sequence_3.json", size: "1.8 MB", lastModified: "2024-12-29", isCompleted: true),
//        GeneFile(name: "Gene_Sequence_4.json", size: "4.2 MB", lastModified: "2024-12-20", isCompleted: true),
//        GeneFile(name: "Gene_Sequence_5.json", size: "2.9 MB", lastModified: "2024-12-15", isCompleted: true)
//    ]
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 15) {
//            ForEach(geneFiles) { file in
//                GeneFileRow(file: file)
//            }
//        }
//        .padding()
//        .background(Color.gray.opacity(0.1))
//        .cornerRadius(10)
//        .padding() // 为内容设置统一的内边距
//        .padding(.horizontal, -15) // 水平外边距
//    }
//}
//


//// 每一行的视图
//struct GeneFileRow: View {
//    let file: GeneFile
//
//    var body: some View {
//        HStack {
//            VStack(alignment: .leading, spacing: 5) {
//                Text(file.name)
//                    .font(.headline)
//                    .foregroundColor(.black)
//                Text("\(file.size) • Last modified: \(file.lastModified)")
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//            }
//
//            Spacer()
//
//            if file.isCompleted {
//                Button(action: {
//                    // 下载或查看文件的操作
//                }) {
//                    Text("Download")
//                        .foregroundColor(.white)
//                        .padding(.vertical, 5)
//                        .padding(.horizontal, 15)
//                        .background(Color.green)
//                        .cornerRadius(8)
//                }
//            } else {
//                Button(action: {
//                    // 查看或处理文件的操作
//                }) {
//                    Text("View")
//                        .foregroundColor(.white)
//                        .padding(.vertical, 5)
//                        .padding(.horizontal, 15)
//                        .background(Color.blue)
//                        .cornerRadius(8)
//                }
//            }
//        }
//        .padding()
//        .background(Color.white)
//        .cornerRadius(10)
//        .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 2)
//    }
//}
//
//// 预览
//struct GeneSequenceListView_Previews: PreviewProvider {
//    static var previews: some View {
//        GeneSequenceListView()
//            .preferredColorScheme(.light)
//    }
//}
