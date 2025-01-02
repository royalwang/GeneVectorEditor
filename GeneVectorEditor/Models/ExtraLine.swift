//
//  ExtraLine.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/2/25.
//

import Foundation

struct ExtraLine: Codable {
    let content: String
    
    // 自定义解码以获取整行字符串
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let line = try container.decode(String.self)
        self.content = line
    }
}
