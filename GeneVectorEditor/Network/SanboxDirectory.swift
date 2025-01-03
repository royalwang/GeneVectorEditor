//
//  SanboxDirectory.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/3/25.
//

import Foundation

func getDocumentsDirectory() -> URL? {
    // 获取应用沙盒中的 Documents 目录
    let fileManager = FileManager.default
    if let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
        print("Documents 目录路径: \(documentsDirectory.path)")
        return documentsDirectory
    }
    return nil
}

