//
//  DashboardView.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/3/25.
//


import SwiftUI

struct MainView: View {
    @State private var selectedMenu: SidebarMenu = .dashboard // 当前选中的菜单

    var body: some View {
        NavigationView {
            HStack(spacing: 0) {
                // Sidebar
                SidebarView(selectedMenu: $selectedMenu)

                // Main Content
                VStack(alignment: .leading, spacing: 20) {
                    switch selectedMenu {
                    case .dashboard:
                        DashboardContentView()
                    case .stackmap:
                        GeneSequenceListView()
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
        // 设置单页面导航样式
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
