//
//  Functions.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/4/25.
//

import SwiftUI

func colorFromString(_ colorString: String) -> Color {
    switch colorString.lowercased() {
    case "green": return .green
    case "blue": return .blue
    case "purple": return .purple
    case "red": return .red
    default: return .gray
    }
}
