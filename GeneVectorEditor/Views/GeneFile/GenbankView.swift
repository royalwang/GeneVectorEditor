//
//  GenbankView.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/3/25.
//


import SwiftUI

struct GenbankView: View {
    let genbankInfo: String // The GenBank format data as a single string.
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                Text(genbankInfo)
                    .font(.system(.body, design: .monospaced)) // Monospaced font for readability
                    .foregroundColor(.primary)
                    .padding()
            }
        }
        .background(Color(.systemGray6)) // Light background for contrast
        .cornerRadius(8)
        .shadow(radius: 2)
        .padding()
    }
}
