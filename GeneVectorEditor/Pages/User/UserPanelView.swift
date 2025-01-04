//
//  UserPanelView.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/3/25.
//

import SwiftUI

struct UserPanelView: View {
    @State private var showUserProfile: Bool = false // 控制弹窗的显示状态

    var body: some View {
        Button(action: {
            showUserProfile = true // 点击时显示弹窗
        }) {
            HStack {
                // 用户头像
                Circle()
                    .fill(Color.purple)
                    .frame(width: 40, height: 40)
                    .overlay(
                        Text("D") // 用户首字母
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    )

                // 用户信息
                VStack(alignment: .leading, spacing: 2) {
                    Text("Daniel Sayer") // 用户名
                        .font(.headline)
                        .foregroundColor(.white)
                    Text("More Options") // 说明文本
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }

                Spacer()

                // 更多图标
                Image(systemName: "ellipsis")
                    .foregroundColor(.gray)
            }
            .padding(10)
            .background(Color.black.opacity(0.8))
            .cornerRadius(10)
        }
        .sheet(isPresented: $showUserProfile) { // 弹窗内容
            UserDetailModalView()
        }
    }
}
