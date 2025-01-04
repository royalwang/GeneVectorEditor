//
//  UserDetailModalView.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/3/25.
//

import SwiftUI

struct UserDetailModalView: View {
    var body: some View {
        VStack(spacing: 20) {
            // 关闭按钮
            HStack {
                Spacer()
                Button(action: {
                    // 手动关闭模态框（如果有绑定状态，可以通过修改状态值实现）
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.gray)
                }
            }
            .padding()

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
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Image(systemName: "envelope")
                        .foregroundColor(.gray)
                    Text("daniel.sayer@example.com")
                        .font(.body)
                        .foregroundColor(.black)
                }

                HStack {
                    Image(systemName: "phone")
                        .foregroundColor(.gray)
                    Text("+1 123 456 7890")
                        .font(.body)
                        .foregroundColor(.black)
                }

                Text("Bio: Software Engineer with a passion for technology and innovation.")
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.black)
            }
            .padding()

            Spacer()

            // 退出登录按钮
            Button(action: {
                // 添加登出逻辑
                print("Log Out")
            }) {
                Text("Log Out")
                    .foregroundColor(.red)
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
            }
            .padding(.horizontal)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
        .frame(maxHeight: .infinity, alignment: .top) // 让弹窗自适应内容
    }
}
