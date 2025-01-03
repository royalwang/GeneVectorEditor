//
//  SidebarView 2.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/3/25.
//

import SwiftUI

struct SidebarView2: View {
    var body: some View {
        List {
            NavigationLink(destination: DashboardView2()) {
                SidebarItem2(icon: "rectangle.grid.2x2", title: "Dashboard")
            }
            NavigationLink(destination: StackmapView2()) {
                SidebarItem2(icon: "map", title: "Stackmap")
            }
            NavigationLink(destination: CapabilitiesView2()) {
                SidebarItem2(icon: "gearshape.2", title: "Capabilities")
            }
            NavigationLink(destination: TechnologiesView2()) {
                SidebarItem2(icon: "cpu", title: "Technologies")
            }
            NavigationLink(destination: RoadmapView2()) {
                SidebarItem2(icon: "arrow.triangle.branch", title: "Roadmap")
            }
            Section {
                NavigationLink(destination: NotificationsView2()) {
                    SidebarItem2(icon: "bell", title: "Notifications")
                }
                NavigationLink(destination: SettingsView2()) {
                    SidebarItem2(icon: "gearshape", title: "Settings")
                }
                NavigationLink(destination: HelpView2()) {
                    SidebarItem2(icon: "questionmark.circle", title: "Help")
                }
            }
            Spacer()
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
            }
        }
        .listStyle(SidebarListStyle())
        .background(Color.black)
    }
}


struct SidebarItem2: View {
    let icon: String
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundColor(.gray)
                .frame(width: 24)
            Text(title)
                .foregroundColor(.gray)
            Spacer()
        }
        .padding(.vertical, 5)
    }
}
