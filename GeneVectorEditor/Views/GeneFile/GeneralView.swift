//
//  PartsView.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/2/25.
//

import SwiftUI

struct GeneralView: View {
    let gene: Gene
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Name: \(gene.name)")
            Text("Type: \(gene.type)")
            Text("Size: \(gene.size) bp")
            Text("Structure: \(gene.circular ? "Circular" : "Linear")")
            Text("Description: \(gene.description)")
        }
        .padding()
    }
}
