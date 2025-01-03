//
//  SidebarView.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/3/25.
//


import SwiftUI

struct SidebarView: View {
    @Binding var selectedMenu: SidebarMenu
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Logo Section
            VStack(alignment: .leading, spacing: 5) {
                Text("GeneSequence")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                HStack {
                    Text("Gene Vector Editor")
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .foregroundColor(.gray)
                }
            }
            .padding(.top, 20)

            // Navigation Links
            VStack(alignment: .leading, spacing: 15) {
                SidebarItem(icon: "rectangle.grid.2x2", title: "Dashboard", isSelected: selectedMenu == .dashboard) {
                    selectedMenu = .dashboard
                }
                SidebarItem(icon: "map", title: "Stackmap", isSelected: selectedMenu == .stackmap) {
                    selectedMenu = .stackmap
                }
                SidebarItem(icon: "gearshape.2", title: "Capabilities", isSelected: selectedMenu == .capabilities) {
                    selectedMenu = .capabilities
                }
                SidebarItem(icon: "cpu", title: "Technologies", isSelected: selectedMenu == .technologies) {
                    selectedMenu = .technologies
                }
                SidebarItem(icon: "arrow.triangle.branch", title: "Roadmap", isSelected: selectedMenu == .roadmap) {
                    selectedMenu = .roadmap
                }
            }
            .padding(.top, 20)

            Spacer()

            // Secondary Links
            VStack(alignment: .leading, spacing: 15) {
                SidebarItem(icon: "bell", title: "Notifications", isSelected: selectedMenu == .notification) {
                    selectedMenu = .notification
                }
                SidebarItem(icon: "gearshape", title: "Settings", isSelected: selectedMenu == .setting) {
                    selectedMenu = .setting
                }
                SidebarItem(icon: "questionmark.circle", title: "Help", isSelected: selectedMenu == .help) {
                    selectedMenu = .help
                }
            }

            // User Info
            HStack {
                Circle()
                    .fill(Color.purple)
                    .frame(width: 30, height: 30)
                    .overlay(
                        Text("D")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    )
                VStack(alignment: .leading) {
                    Text("Daniel Sayer")
                        .foregroundColor(.white)
                        .font(.footnote)
                    Text("More Options")
                        .foregroundColor(.gray)
                        .font(.caption)
                }
                Spacer()
                Image(systemName: "ellipsis")
                    .foregroundColor(.gray)
            }
            .padding(.bottom, 20)
        }
        .padding()
        .frame(width: 250)
        .background(Color.black)
        .ignoresSafeArea()
    }
}

// 侧边栏菜单项
struct SidebarItem: View {
    let icon: String
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 10) {
                Image(systemName: icon)
                    .foregroundColor(isSelected ? .green : .gray)
                    .frame(width: 24)
                Text(title)
                    .foregroundColor(isSelected ? .white : .gray)
                    .fontWeight(isSelected ? .bold : .regular)
                Spacer()
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 5)
            .background(isSelected ? Color.gray.opacity(0.2) : Color.clear)
            .cornerRadius(8)
        }
        .buttonStyle(PlainButtonStyle()) // 去掉默认按钮样式
    }
}

//struct SidebarItem: View {
//    let icon: String
//    let title: String
//    var isSelected: Bool = false
//
//    var body: some View {
//        HStack(spacing: 10) {
//            Image(systemName: icon)
//                .foregroundColor(isSelected ? .green : .gray)
//                .frame(width: 24)
//            Text(title)
//                .foregroundColor(isSelected ? .white : .gray)
//                .fontWeight(isSelected ? .bold : .regular)
//            Spacer()
//        }
//        .padding(.vertical, 10)
//        .padding(.horizontal, 5)
//        .background(isSelected ? Color.gray.opacity(0.2) : Color.clear)
//        .cornerRadius(8)
//    }
//}

//struct SidebarView_Previews: PreviewProvider {
//    static var previews: some View {
//        SidebarView()
//            .preferredColorScheme(.dark)
//    }
//}
