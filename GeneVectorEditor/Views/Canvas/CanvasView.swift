//
//  SVGView.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/14/25.
//

import SwiftUI

struct CanvasView: View {
    var body: some View {
        Canvas { context, size in
            context.stroke(Path { path in
                path.move(to: CGPoint(x: 50, y: 50))
                path.addLine(to: CGPoint(x: 150, y: 50))
                path.addLine(to: CGPoint(x: 150, y: 150))
                path.addLine(to: CGPoint(x: 50, y: 150))
                path.closeSubpath()
            }, with: .color(.blue), lineWidth: 5)
        }
        .frame(width: 200, height: 200)
    }
}


struct CanvasView_Previews: PreviewProvider {
    static var previews: some View {
        CanvasView()
    }
}
