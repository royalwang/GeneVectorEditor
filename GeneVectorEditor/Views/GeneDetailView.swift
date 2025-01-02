//
//  GeneDetailView.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/2/25.
//

import SwiftUI

struct GeneDetailView: View {
    let gene: Gene
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Group {
                    Text("名称: \(gene.name)")
                        .font(.title2)
                    Text("定义: \(gene.definition)")
                        .font(.body)
                    Text("描述: \(gene.description)")
                        .font(.body)
                    Text("序列类型: \(gene.sequenceTypeFromLocus)")
                        .font(.body)
                    Text("是否双链 DNA: \(gene.isDoubleStrandedDNA ? "是" : "否")")
                        .font(.body)
                    Text("日期: \(gene.date)")
                        .font(.body)
                }
                
                Divider()
                
                Text("序列:")
                    .font(.headline)
                ScrollView(.horizontal) {
                    Text(gene.sequence)
                        .font(.system(.body, design: .monospaced))
                        .foregroundColor(.green)
                }
                
                Divider()
                
                Text("特征:")
                    .font(.headline)
                ForEach(gene.features!) { feature in
                    FeatureView(feature: feature)
                }
                
                Divider()
                
                Text("引物:")
                    .font(.headline)
                ForEach(gene.primers!) { primer in
                    PrimerView(primer: primer)
                }
                
                Divider()
                
                Text("翻译:")
                    .font(.headline)
                ForEach(gene.translations!) { translation in
                    TranslationView(translation: translation)
                }
                
                // 可根据需要添加更多部分，如 extraLines, comments 等
            }
            .padding()
        }
        .navigationTitle(gene.name)
    }
}
