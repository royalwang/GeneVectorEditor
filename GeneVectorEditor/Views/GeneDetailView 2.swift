//
//  GeneDetailView 2.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/2/25.
//


import SwiftUI

struct GeneDetailView2: View {
    @StateObject private var geneData = GeneData()
    
    var body: some View {
        NavigationView {
            List(geneData.genes) { gene in
                NavigationLink(destination: FileDetailPage3(gene: gene)) {
                    VStack(alignment: .leading) {
                        Text(gene.name)
                            .font(.headline)
                        Text(gene.definition)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .onAppear {
                geneData.loadGenes() // 加载基因数据
            }
            .navigationBarTitle("Gene List", displayMode: .inline)
        }
    }
}
