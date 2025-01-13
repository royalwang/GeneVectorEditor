//
//  AnnotationContent.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/14/25.
//

import SwiftUI

struct AnnotationContent {
    var name: String
    var customName: String?
    var truncateLabelsThatDoNotFit: Bool
    var onlyShowLabelsThatDoNotFit: Bool
    
    init(name: String, customName: String? = nil, truncateLabelsThatDoNotFit: Bool = false, onlyShowLabelsThatDoNotFit: Bool = false) {
        self.name = customName ?? name
        self.truncateLabelsThatDoNotFit = truncateLabelsThatDoNotFit
        self.onlyShowLabelsThatDoNotFit = onlyShowLabelsThatDoNotFit
    }

    func getNameToDisplay(width: Double, charWidth: Double, pointiness: Double) -> (nameToDisplay: String, textOffset: Double) {
        var nameToDisplay = self.name
        var textOffset = width / 2 - (Double(nameToDisplay.count) * 5) / 2 - (pointiness / 2)

        if truncateLabelsThatDoNotFit {
            let fractionToDisplay = width / (Double(nameToDisplay.count) * 5)
            let numLetters = Int(fractionToDisplay * Double(nameToDisplay.count))
            nameToDisplay = String(nameToDisplay.prefix(numLetters))
            if nameToDisplay.count > 3 {
                if nameToDisplay.count != self.name.count {
                    nameToDisplay += ".."
                }
            } else {
                textOffset = 0
                nameToDisplay = ""
            }
        }
        
        return (nameToDisplay, textOffset)
    }
}
