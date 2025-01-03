////
////  SidebarView.swift
////  GeneVectorEditor
////
////  Created by Wang Zhengdong on 1/3/25.
////
//
//
//import SwiftUI
//
//struct SidebarView: View {
//    var body: some View {
//        VStack(alignment: .leading, spacing: 20) {
//            // Logo Section
//            VStack(alignment: .leading, spacing: 5) {
//                Text("STACKMAP")
//                    .font(.caption)
//                    .fontWeight(.bold)
//                    .foregroundColor(.gray)
//                HStack {
//                    Text("Never Before Seen")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                    Spacer()
//                    Image(systemName: "chevron.down")
//                        .foregroundColor(.gray)
//                }
//            }
//            .padding(.top, 20)
//
//            // Navigation Links
//            VStack(alignment: .leading, spacing: 15) {
//                SidebarItem(icon: "rectangle.grid.2x2", title: "Dashboard", isSelected: true)
//                SidebarItem(icon: "map", title: "Stackmap")
//                SidebarItem(icon: "gearshape.2", title: "Capabilities")
//                SidebarItem(icon: "cpu", title: "Technologies")
//                SidebarItem(icon: "arrow.triangle.branch", title: "Roadmap")
//            }
//            .padding(.top, 20)
//
//            Spacer()
//
//            // Secondary Links
//            VStack(alignment: .leading, spacing: 15) {
//                SidebarItem(icon: "bell", title: "Notifications")
//                SidebarItem(icon: "gearshape", title: "Settings")
//                SidebarItem(icon: "questionmark.circle", title: "Help")
//            }
//
//            // User Info
//            HStack {
//                Circle()
//                    .fill(Color.purple)
//                    .frame(width: 30, height: 30)
//                    .overlay(
//                        Text("D")
//                            .foregroundColor(.white)
//                            .fontWeight(.bold)
//                    )
//                VStack(alignment: .leading) {
//                    Text("Daniel Sayer")
//                        .foregroundColor(.white)
//                        .font(.footnote)
//                    Text("More Options")
//                        .foregroundColor(.gray)
//                        .font(.caption)
//                }
//                Spacer()
//                Image(systemName: "ellipsis")
//                    .foregroundColor(.gray)
//            }
//            .padding(.bottom, 20)
//        }
//        .padding()
//        .frame(width: 250)
//        .background(Color.black)
//        .ignoresSafeArea()
//    }
//}
//
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
//
//struct SidebarView_Previews: PreviewProvider {
//    static var previews: some View {
//        SidebarView()
//            .preferredColorScheme(.dark)
//    }
//}
