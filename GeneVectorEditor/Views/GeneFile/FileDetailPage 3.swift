//
//  FileDetailPage 3.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/2/25.
//


import SwiftUI

struct FileDetailPage3: View {
    @State private var selectedTab: String = "General"
    @State private var gene: Gene? = nil
    @State private var loadingError: String? = nil
    
    let fileName: String // 文件名
    
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
            
            // Tab Content
            if let gene = gene {
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
            } else if let error = loadingError {
                // 显示加载错误
                Text("Error loading file: \(error)")
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
            } else {
                // 加载中状态
                ProgressView("Loading...")
            }
        }
        .onAppear {
            loadGeneFile()
        }
    }
    
    private func loadGeneFile() {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let genesDirectory = documentsDirectory.appendingPathComponent("genes")
        let filePath = genesDirectory.appendingPathComponent(fileName)
        
        do {
            let data = try Data(contentsOf: filePath)
            let loadedGene = try JSONDecoder().decode(Gene.self, from: data)
            self.gene = loadedGene
        } catch {
            self.loadingError = error.localizedDescription
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
