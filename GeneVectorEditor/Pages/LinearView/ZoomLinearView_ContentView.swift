//
//  ContentView.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/13/25.
//

import SwiftUI

struct ZoomLinearView_ContentView: View {
    @State private var charWidth: CGFloat = 10.0

    var body: some View {
        ZoomLinearView(
            charWidth: $charWidth,
            minCharWidth: 5,
            bindOutsideChangeHelper: nil,
            afterOnChange: nil,
            smallSlider: false
        )
        .frame(width: 300, height: 100)
    }
}
