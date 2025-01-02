//
//  GeneCellView.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/2/25.
//

import SwiftUI

struct GeneCellView: View {
    let gene: Gene
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(gene.name)
                .font(.headline)
            Text("类型: \(gene.type)")
                .font(.subheadline)
                .foregroundColor(.gray)
            Text("大小: \(gene.size) bp")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}
