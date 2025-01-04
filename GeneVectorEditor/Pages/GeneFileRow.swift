//
//  GeneFileRow.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/4/25.
//

import SwiftUI

struct GeneFileRow: View {
    let file: GeneFile
    let onDelete: (String) -> Void // 删除文件的回调

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(file.name)
                    .font(.headline)
                    .foregroundColor(.black)
                Text("\(file.size) • Last modified: \(file.lastModified)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()

            Button(action: {
                onDelete(file.name)
            }) {
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}
