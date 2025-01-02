//
//  FeatureView.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/2/25.
//

import SwiftUI

struct FeatureView: View {
    let feature: Feature
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("类型: \(feature.type)")
                .font(.subheadline)
                .foregroundColor(.blue)
            Text("名称: \(feature.name)")
                .font(.body)
            Text("位置: \(feature.start) - \(feature.end)")
                .font(.body)
            if let notes = feature.notes.note?.joined(separator: ", ") {
                Text("备注: \(notes)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 4)
        .background(Color(hex: feature.color).opacity(0.2))
        .cornerRadius(8)
    }
}
