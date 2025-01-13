//
//  SequenceName.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/13/25.
//


import SwiftUI

struct SequenceName: View {
    var sequenceName: String
    var sequenceLength: Int
    var isProtein: Bool
    
    var body: some View {
        VStack {
            Text(sequenceName)
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .center)
            Text(isProtein
                 ? "\(sequenceLength / 3) AAs"
                 : "\(sequenceLength) bps")
                .font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding()
    }
}

struct SequenceName_Previews: PreviewProvider {
    static var previews: some View {
        SequenceName(sequenceName: "Sequence XYZ", sequenceLength: 900, isProtein: true)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
