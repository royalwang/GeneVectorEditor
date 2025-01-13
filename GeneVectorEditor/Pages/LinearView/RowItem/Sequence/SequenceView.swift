//
//  SequenceView.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/14/25.
//


import SwiftUI

struct SequenceView: View {
    let forwardSequence: String
    let reverseSequence: String
    let charWidth: CGFloat
    let height: CGFloat
    
    var body: some View {
        VStack(spacing: 4) {
            HStack(spacing: 0) {
                Text("5'")
                    .foregroundColor(.gray)
                    .padding(.trailing, 8)
                
                // 显示前向序列
                ForEach(0..<forwardSequence.count, id: \.self) { index in
                    Text(String(forwardSequence[forwardSequence.index(forwardSequence.startIndex, offsetBy: index)]))
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.black)
                        .frame(width: charWidth, height: height, alignment: .center)
                }
                
                Text("3'")
                    .foregroundColor(.gray)
                    .padding(.leading, 8)
            }
            
            HStack(spacing: 0) {
                Text("3'")
                    .foregroundColor(.gray)
                    .padding(.trailing, 8)
                
                // 显示反向序列
                ForEach(0..<reverseSequence.count, id: \.self) { index in
                    Text(String(reverseSequence[reverseSequence.index(reverseSequence.startIndex, offsetBy: index)]))
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                        .frame(width: charWidth, height: height, alignment: .center)
                }
                
                Text("5'")
                    .foregroundColor(.gray)
                    .padding(.leading, 8)
            }
        }
    }
}

struct SequenceView_ContentView: View {
    var body: some View {
        SequenceView(
            forwardSequence: "attatcatgacatataccctataaaaataggcgtatcacgaggccctttcgcttctcaagattcccgacaccatcgaatggtgcaaaa",
            reverseSequence: "taatagtagtgtaattggatattttatccgcataagtcgctggggaagcgaagagttctaagggctgtggtagttaccactgttttaa",
            charWidth: 14,
            height: 20
        )
        .padding()
    }
}

struct SequenceView_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SequenceView_ContentView()
    }
}
