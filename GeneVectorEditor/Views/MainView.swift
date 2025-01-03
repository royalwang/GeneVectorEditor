//
//  MainView.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/3/25.
//


import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            SidebarView()
            Text("Select a menu item")
                .font(.largeTitle)
                .foregroundColor(.gray)
        }
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
}

struct SidebarView: View {
    var body: some View {
        List {
            NavigationLink(destination: DashboardView()) {
                SidebarItem(icon: "rectangle.grid.2x2", title: "Dashboard")
            }
            NavigationLink(destination: StackmapView()) {
                SidebarItem(icon: "map", title: "Stackmap")
            }
            NavigationLink(destination: CapabilitiesView()) {
                SidebarItem(icon: "gearshape.2", title: "Capabilities")
            }
            NavigationLink(destination: TechnologiesView()) {
                SidebarItem(icon: "cpu", title: "Technologies")
            }
            NavigationLink(destination: RoadmapView()) {
                SidebarItem(icon: "arrow.triangle.branch", title: "Roadmap")
            }
            Section {
                NavigationLink(destination: NotificationsView()) {
                    SidebarItem(icon: "bell", title: "Notifications")
                }
                NavigationLink(destination: SettingsView()) {
                    SidebarItem(icon: "gearshape", title: "Settings")
                }
                NavigationLink(destination: HelpView()) {
                    SidebarItem(icon: "questionmark.circle", title: "Help")
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

struct SidebarItem: View {
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

// Empty views for each menu option
struct DashboardView: View {
    var body: some View {
        Text("Dashboard View")
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

struct StackmapView: View {
    var body: some View {
        Text("Stackmap View")
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

struct CapabilitiesView: View {
    var body: some View {
        Text("Capabilities View")
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

struct TechnologiesView: View {
    var body: some View {
        Text("Technologies View")
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

struct RoadmapView: View {
    var body: some View {
        Text("Roadmap View")
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

struct NotificationsView: View {
    var body: some View {
        Text("Notifications View")
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

struct SettingsView: View {
    var body: some View {
        Text("Settings View")
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

struct HelpView: View {
    var body: some View {
        Text("Help View")
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

// Preview
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(.dark)
    }
}
