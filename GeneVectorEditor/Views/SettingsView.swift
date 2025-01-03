//
//  SettingsView.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/3/25.
//


import SwiftUI

struct SettingsView: View {
    @State private var isNotificationEnabled: Bool = true
    @State private var isDarkModeEnabled: Bool = false
    @State private var isAutoUpdateEnabled: Bool = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Settings")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 10)

            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    // General Settings
                    SettingsSection(title: "General") {
                        Toggle("Enable Notifications", isOn: $isNotificationEnabled)
                        Toggle("Enable Dark Mode", isOn: $isDarkModeEnabled)
                        Toggle("Enable Auto Updates", isOn: $isAutoUpdateEnabled)
                    }

                    // Account Settings
                    SettingsSection(title: "Account") {
                        NavigationLink(destination: Text("Profile Page")) {
                            SettingsRow(icon: "person.crop.circle", title: "Profile", actionText: "View")
                        }
                        NavigationLink(destination: Text("Security Page")) {
                            SettingsRow(icon: "lock.shield", title: "Security", actionText: "Manage")
                        }
                        NavigationLink(destination: Text("Subscription Page")) {
                            SettingsRow(icon: "creditcard", title: "Subscription", actionText: "Upgrade")
                        }
                    }

                    // About Settings
                    SettingsSection(title: "About") {
                        NavigationLink(destination: Text("Privacy Policy")) {
                            SettingsRow(icon: "doc.text.magnifyingglass", title: "Privacy Policy")
                        }
                        NavigationLink(destination: Text("Terms of Service")) {
                            SettingsRow(icon: "doc.plaintext", title: "Terms of Service")
                        }
                        NavigationLink(destination: Text("App Version")) {
                            SettingsRow(icon: "info.circle", title: "App Version", detailText: "1.0.0")
                        }
                    }
                }
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        .padding()
    }
}

// 通用的设置分组
struct SettingsSection<Content: View>: View {
    let title: String
    let content: Content

    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(title)
                .font(.headline)
                .foregroundColor(.gray)
            VStack(spacing: 10) {
                content
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 2)
        }
    }
}

// 通用的设置行
struct SettingsRow: View {
    let icon: String
    let title: String
    var actionText: String? = nil
    var detailText: String? = nil

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.blue)
                .frame(width: 24)
            Text(title)
                .font(.body)
            Spacer()

            if let detailText = detailText {
                Text(detailText)
                    .foregroundColor(.gray)
                    .font(.subheadline)
            }

            if let actionText = actionText {
                Text(actionText)
                    .foregroundColor(.blue)
                    .fontWeight(.bold)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(5)
            }

            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding(.vertical, 5)
    }
}

// 预览
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.light)
    }
}
