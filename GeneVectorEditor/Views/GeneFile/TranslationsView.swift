//
//  TranslationsView.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/3/25.
//


import SwiftUI

struct TranslationsView: View {
    let translations: [GeneTranslation] // Accept the translations array from the GeneFile model.

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                ForEach(translations, id: \.id) { translation in
                    TranslationCard(translation: translation)
                }
            }
            .padding()
        }
    }
}

struct TranslationCard: View {
    let translation: GeneTranslation // A single translation to display.

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(translation.name)
                .font(.headline)
                .foregroundColor(.green)
            Text("Type: \(translation.type)")
                .font(.subheadline)
            Text("Position: \(translation.start) - \(translation.end)")
                .font(.subheadline)
            Text("Strand: \(translation.strand == 1 ? "Forward" : "Reverse")")
                .font(.subheadline)
            
            if let product = translation.notes.product?.first {
                Text("Product: \(product)")
                    .font(.subheadline)
                    .foregroundColor(.blue)
            }
            
            if let notes = translation.notes.note?.joined(separator: ", ") {
                Text("Notes: \(notes)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color(hex: translation.color).opacity(0.2)) // Background color based on translation's color.
        .cornerRadius(8)
        .shadow(radius: 2)
    }
}
