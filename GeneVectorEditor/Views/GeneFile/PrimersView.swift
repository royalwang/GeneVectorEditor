//
//  PrimersView.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/3/25.
//


import SwiftUI

struct PrimersView: View {
    let primers: [GenePrimer] // Accept the primers array from the GeneFile model.

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                ForEach(primers, id: \.id) { primer in
                    PrimerCard(primer: primer)
                }
            }
            .padding()
        }
    }
}

struct PrimerCard: View {
    let primer: GenePrimer // A single primer to display.

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(primer.name)
                .font(.headline)
                .foregroundColor(.teal)
            Text("Type: \(primer.type)")
                .font(.subheadline)
            Text("Position: \(primer.start) - \(primer.end)")
                .font(.subheadline)
            Text("Strand: \(primer.strand == 1 ? "Forward" : "Reverse")")
                .font(.subheadline)
            
            if let notes = primer.notes.note?.joined(separator: ", ") {
                Text("Notes: \(notes)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color(hex: primer.color).opacity(0.2)) // Background color based on primer's color.
        .cornerRadius(8)
        .shadow(radius: 2)
    }
}
