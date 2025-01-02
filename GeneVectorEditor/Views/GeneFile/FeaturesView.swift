//
//  FeaturesView.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/2/25.
//

import SwiftUI

struct FeaturesView: View {
    let features: [GeneFeature] // Accept the features array from the GeneFile model.
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                ForEach(features, id: \.id) { feature in
                    FeatureCard(feature: feature)
                }
            }
            .padding()
        }
    }
}

struct FeatureCard: View {
    let feature: GeneFeature // A single feature to display.
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(feature.name)
                .font(.headline)
                .foregroundColor(.blue)
            Text("Type: \(feature.type)")
                .font(.subheadline)
            Text("Position: \(feature.start) - \(feature.end)")
                .font(.subheadline)
            Text("Strand: \(feature.strand == 1 ? "Forward" : "Reverse")")
                .font(.subheadline)
            
            if let notes = feature.notes.note?.joined(separator: ", ") {
                Text("Notes: \(notes)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color(hex: feature.color).opacity(0.2)) // Custom color based on the feature's color.
        .cornerRadius(8)
        .shadow(radius: 2)
    }
}
