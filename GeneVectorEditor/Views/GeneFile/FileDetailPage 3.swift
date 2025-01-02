//
//  FileDetailPage 3.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/2/25.
//


import SwiftUI

struct FileDetailPage3: View {
    @State private var selectedTab: String = "General"
    let gene: Gene
    
    // General
    @State private var isEditable: Bool = true
    @State private var isMaterialAvailable: Bool = true
    @State private var geneDescription: String = ""
    @State private var history: String = ""
    
    var body: some View {
        VStack {
            // Custom Tab Bar
            HStack {
                TabButton(title: "General", selectedTab: $selectedTab)
                TabButton(title: "Features", selectedTab: $selectedTab)
                TabButton(title: "Parts", selectedTab: $selectedTab)
                TabButton(title: "Primers", selectedTab: $selectedTab)
                TabButton(title: "Translations", selectedTab: $selectedTab)
                TabButton(title: "Cut Sites", selectedTab: $selectedTab)
                TabButton(title: "ORFs", selectedTab: $selectedTab)
                TabButton(title: "Genbank", selectedTab: $selectedTab)
            }
            .padding(.horizontal)
            .padding(.top)
            
            // Tab Content
            Divider()
            ScrollView {
                switch selectedTab {
                case "General":
                    GeneralView(gene: gene)
                case "Features":
                    FeaturesView2(features: gene.features ?? [])
                case "Parts":
                    PartsView(parts: gene.parts)
                case "Primers":
                    PrimersView(primers: gene.primers ?? [])
                case "Translations":
                    TranslationsView(translations: gene.translations ?? [])
                case "Cut Sites":
                    CutSitesView(cutSites: gene.cutSites ?? [])
                case "ORFs":
                    ORFsView(orfs: gene.orfs ?? [])
                case "Genbank":
                    GenbankView(genbankInfo: "")
                default:
                    Text("Select a tab")
                }
            }
        }
    }
}

struct TabButton: View {
    let title: String
    @Binding var selectedTab: String
    
    var body: some View {
        Button(action: {
            selectedTab = title
        }) {
            Text(title)
                .foregroundColor(selectedTab == title ? .blue : .black)
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity)
                .overlay(
                    Rectangle()
                        .fill(selectedTab == title ? Color.blue : Color.clear)
                        .frame(height: 2),
                    alignment: .bottom
                )
        }
        .buttonStyle(PlainButtonStyle())
    }
}
