//
//  ManageEnzymesView.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/2/25.
//

import SwiftUI

struct ManageEnzymesView: View {
    @Binding var groups: String
    @Binding var hidden: Bool
    
    var body: some View {
        Form {
            Section(header: Text("Manage Enzymes")) {
                TextField("Enzyme Groups", text: $groups)
                Toggle("Hidden", isOn: $hidden)
            }
        }
    }
}
