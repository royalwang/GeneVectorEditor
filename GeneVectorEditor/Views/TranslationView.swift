//
//  FtranslationView.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/2/25.
//

import SwiftUI

struct TranslationView: View {
    let translation: Translation
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("名称: \(translation.name)")
                .font(.subheadline)
                .foregroundColor(.orange)
            Text("类型: \(translation.type)")
                .font(.body)
            Text("位置: \(translation.start) - \(translation.end)")
                .font(.body)
            if let notes = translation.notes.note?.joined(separator: ", ") {
                Text("备注: \(notes)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            if let translationText = translation.notes.translation?.first {
                Text("翻译: \(translationText)")
                    .font(.body)
                    .foregroundColor(.green)
            }
        }
        .padding(.vertical, 4)
        .background(Color(hex: translation.color).opacity(0.2))
        .cornerRadius(8)
    }
}
