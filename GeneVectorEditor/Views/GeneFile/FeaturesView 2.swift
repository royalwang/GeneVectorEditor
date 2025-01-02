//
//  FeaturesView 2.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/3/25.
//


import SwiftUI

struct FeaturesView2: View {
    let features: [GeneFeature]
    
    // Define the columns for our "table"
    private let columns = [
        GridItem(.flexible(minimum: 80, maximum: .infinity)), // Name column
        GridItem(.flexible(minimum: 60, maximum: .infinity)), // Type column
        GridItem(.flexible(minimum: 120, maximum: .infinity)), // Position column
        GridItem(.flexible(minimum: 60, maximum: .infinity)), // Strand column
        GridItem(.flexible(minimum: 80, maximum: .infinity))  // Notes column
    ]
    
    var body: some View {
        ScrollView {
            // A vertical stack to separate our header and data grid
            VStack(alignment: .leading) {
                
                // MARK: - Table Header
                LazyVGrid(columns: columns, spacing: 16) {
                    Text("Name").bold()
                    Text("Type").bold()
                    Text("Position").bold()
                    Text("Strand").bold()
                    Text("Notes").bold()
                }
                .padding(.bottom, 8)
                
                Divider()
                
                // MARK: - Table Rows (Data)
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(features, id: \.id) { feature in
                        // Each column cell content:
                        
                        Text(feature.name) // Name
                            .foregroundColor(Color(hex: feature.color) ?? .blue)
                        
                        Text(feature.type) // Type
                        
                        // e.g. "9 - 53"
                        Text("\(feature.start) - \(feature.end)")
                        
                        // Strand info
                        Text(feature.strand == 1 ? "Forward" : "Reverse")
                        
                        // Notes, joined if multiple
                        if let notesList = feature.notes.note, !notesList.isEmpty {
                            Text(notesList.joined(separator: ", "))
                                .foregroundColor(.gray)
                                .font(.footnote)
                        } else {
                            Text("-")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .padding(.top, 8)
            }
            .padding(16)
        }
    }
}
