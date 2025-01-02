//
//  PartsView 2.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/2/25.
//


import SwiftUI

struct PartsView: View {
    let parts: [GenePart] // Accept the parts array from the GeneFile model.

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                ForEach(parts, id: \.id) { part in
                    PartCard(part: part)
                }
            }
            .padding()
        }
    }
}

struct PartCard: View {
    let part: GenePart // A single part to display.

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(part.name)
                .font(.headline)
                .foregroundColor(.purple)
            Text("Size: \(part.size) bp")
                .font(.subheadline)
            Text("Strand: \(part.strand == 1 ? "Forward" : "Reverse")")
                .font(.subheadline)
            
            if let tags = part.tags?.joined(separator: ", ") {
                Text("Tags: \(tags)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color(hex: part.color).opacity(0.2)) // Use part's color if provided.
        .cornerRadius(8)
        .shadow(radius: 2)
    }
}
