//
//  CutSitesView.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/3/25.
//


import SwiftUI

struct CutSitesView: View {
    let cutSites: [GeneCutSite] // Accept the cut sites array from the GeneFile model.

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                ForEach(cutSites, id: \.id) { cutSite in
                    CutSiteCard(cutSite: cutSite)
                }
            }
            .padding()
        }
    }
}

struct CutSiteCard: View {
    let cutSite: GeneCutSite // A single cut site to display.

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(cutSite.name)
                .font(.headline)
                .foregroundColor(.red)
            Text("Number of Cuts: \(cutSite.numberOfCuts)")
                .font(.subheadline)
            if let groups = cutSite.groups?.joined(separator: ", ") {
                Text("Groups: \(groups)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color(.systemGray6)) // Neutral background for cut sites.
        .cornerRadius(8)
        .shadow(radius: 2)
    }
}
