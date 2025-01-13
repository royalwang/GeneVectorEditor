//
//  AnnotationStyle.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/14/25.
//

import SwiftUI

struct AnnotationStyle {
    var color: Color
    var fill: Color
    var stroke: Color
    var opacity: Double
    var textColor: Color

    init(color: Color = .orange, fill: Color? = nil, stroke: Color? = nil, opacity: Double = 1.0, textColor: Color? = nil) {
        self.color = color
        self.fill = fill ?? color
        self.stroke = stroke ?? .black
        self.opacity = opacity
        self.textColor = textColor ?? (color.isDark ? .white : .black)
    }
}

extension Color {
    var isDark: Bool {
        guard let components = self.cgColor?.components else { return false }
        let red = components[0]
        let green = components[1]
        let blue = components[2]
        let brightness = (red * 299 + green * 587 + blue * 114) / 1000
        return brightness < 0.5
    }
}
