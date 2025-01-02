//
//  CutSite.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/3/25.
//

import SwiftUI

struct GeneCutSite: Identifiable, Codable {
    let id: String
    let name: String
    let numberOfCuts: Int
    let groups: [String]?
}
