//
//  DashboardView.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/3/25.
//


import SwiftUI

struct DashboardView: View {
    @State private var selectedMenu: SidebarMenu = .dashboard // 当前选中的菜单

    var body: some View {
        HStack(spacing: 0) {
            // Sidebar
            SidebarView(selectedMenu: $selectedMenu)

            // Main Content
            VStack(alignment: .leading, spacing: 20) {
                switch selectedMenu {
                case .dashboard:
                    DashboardContentView()
                case .stackmap:
                    StackmapView()
                case .capabilities:
                    CapabilitiesView()
                case .technologies:
                    TechnologiesView()
                case .roadmap:
                    RoadmapView()
                case .notification:
                    NotificationsView()
                case .setting:
                    SettingsView()
                case .help:
                    HelpView()
                }
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.gray.opacity(0.1)) // 背景色
        }
    }
}

struct StackmapView: View {
    var body: some View {
        Text("Stackmap Content View")
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

struct CapabilitiesView: View {
    var body: some View {
        Text("Capabilities Content View")
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

struct TechnologiesView: View {
    var body: some View {
        Text("Technologies Content View")
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

struct RoadmapView: View {
    var body: some View {
        Text("Roadmap Content View")
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

// 菜单选项的枚举
enum SidebarMenu {
    case dashboard
    case stackmap
    case capabilities
    case technologies
    case roadmap
    //
    case notification
    case setting
    case help
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
