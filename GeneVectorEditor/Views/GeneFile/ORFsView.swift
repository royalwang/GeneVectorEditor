//
//  ORFsView.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/3/25.
//


import SwiftUI

struct ORFsView: View {
    let orfs: [GeneORFs] // Accept the ORFs array from the GeneFile model.

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                ForEach(orfs, id: \.id) { orf in
                    ORFCard(orf: orf)
                }
            }
            .padding()
        }
    }
}

struct ORFCard: View {
    let orf: GeneORFs // A single ORF to display.

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Size: \(orf.size) bp (\(orf.sizeAA) aa)")
                .font(.headline)
                .foregroundColor(.blue)
            Text("Strand: \(orf.strand == 1 ? "Forward" : "Reverse")")
                .font(.subheadline)
            Text("Frame: \(orf.frame)")
                .font(.subheadline)
            
            Rectangle()
                .fill(Color(hex: orf.color))
                .frame(height: 5)
                .cornerRadius(2)
        }
        .padding()
        .background(Color(.systemGray6)) // Neutral background for ORFs.
        .cornerRadius(8)
        .shadow(radius: 2)
    }
}
