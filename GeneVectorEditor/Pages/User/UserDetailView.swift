//
//  UserDetailView.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/3/25.
//

import SwiftUI

struct UserDetailView: View {
    var body: some View {
        VStack(spacing: 20) {
            // 用户头像
            Circle()
                .fill(Color.purple)
                .frame(width: 100, height: 100)
                .overlay(
                    Text("D") // 用户首字母
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                )

            // 用户名
            Text("Daniel Sayer")
                .font(.title)
                .fontWeight(.bold)

            // 用户详细信息
            Text("Email: daniel.sayer@example.com")
                .font(.body)
                .foregroundColor(.gray)

            Text("Phone: +1 123 456 7890")
                .font(.body)
                .foregroundColor(.gray)

            Text("Bio: Software Engineer with a passion for technology and innovation.")
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
                .padding(.horizontal)

            Spacer()
        }
        .padding()
        .navigationTitle("User Profile") // 设置导航标题
        .navigationBarTitleDisplayMode(.inline) // 标题居中
    }
}
