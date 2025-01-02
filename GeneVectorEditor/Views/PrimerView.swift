//
//  PrimerView.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/2/25.
//

import SwiftUI

struct PrimerView: View {
    let primer: Primer
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("名称: \(primer.name)")
                .font(.subheadline)
                .foregroundColor(.purple)
            Text("类型: \(primer.type)")
                .font(.body)
            Text("位置: \(primer.start) - \(primer.end)")
                .font(.body)
            if let notes = primer.notes.note?.joined(separator: ", ") {
                Text("备注: \(notes)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 4)
        .background(Color(hex: primer.color).opacity(0.2))
        .cornerRadius(8)
    }
}
