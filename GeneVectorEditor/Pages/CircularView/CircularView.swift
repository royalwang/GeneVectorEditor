////
////  CircularView.swift
////  GeneVectorEditor
////
////  Created by Wang Zhengdong on 2024/6/4.
////
//
//import SwiftUI
//
//struct CircularView: View {
//    @State private var scale: CGFloat = 1.0
//    @State private var offset: CGSize = .zero
//    @State private var previousOffset: CGSize = .zero
//
//    let sequenceData: [String]
//    let annotations: [Annotation]
//
//    var body: some View {
//        GeometryReader { geometry in
//            ZStack {
//                Circle()
//                    .stroke(lineWidth: 1)
//                    .foregroundColor(.gray)
//                    .scaleEffect(scale)
//                    .offset(offset)
//                
//                ForEach(annotations, id: \.id) { annotation in
//                    Path { path in
//                        let center = CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2)
//                        let radius = (geometry.size.width / 2 - 20) * scale
//                        let angle = Angle(degrees: Double(annotation.position) / Double(sequenceData.count) * 360.0)
//
//                        path.move(to: center)
//                        path.addLine(to: CGPoint(
//                            x: center.x + radius * cos(CGFloat(angle.radians)),
//                            y: center.y + radius * sin(CGFloat(angle.radians))
//                        ))
//                    }
//                    .stroke(Color.red, lineWidth: 2)
//                    .offset(offset)
//                }
//            }
//            .gesture(MagnificationGesture()
//                        .onChanged { value in
//                            self.scale = value.magnitude
//                        }
//            )
//            .gesture(DragGesture()
//                        .onChanged { value in
//                            self.offset = CGSize(
//                                width: self.previousOffset.width + value.translation.width,
//                                height: self.previousOffset.height + value.translation.height
//                            )
//                        }
//                        .onEnded { value in
//                            self.previousOffset = self.offset
//                        }
//            )
//        }
//    }
//}
//
//
//
//struct CircularView_Previews: PreviewProvider {
//    static var previews: some View {
//        CircularView(
//            sequenceData: Array(repeating: "A", count: 100),
//            annotations: [
//                Annotation(position: 10),
//                Annotation(position: 30),
//                Annotation(position: 50)
//            ]
//        )
//    }
//}
