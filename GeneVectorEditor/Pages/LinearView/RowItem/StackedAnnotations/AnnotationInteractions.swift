//
//  AnnotationInteractions.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/14/25.
//

import SwiftUI

struct AnnotationInteractions {
    var onClick: () -> Void
    var onDoubleClick: () -> Void
    var onRightClick: () -> Void
    
    init(onClick: @escaping () -> Void = {}, onDoubleClick: @escaping () -> Void = {}, onRightClick: @escaping () -> Void = {}) {
        self.onClick = onClick
        self.onDoubleClick = onDoubleClick
        self.onRightClick = onRightClick
    }
}
