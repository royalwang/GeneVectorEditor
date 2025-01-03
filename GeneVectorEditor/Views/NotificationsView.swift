//
//  NotificationsView.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/3/25.
//


import SwiftUI

struct NotificationsView: View {
    @State private var notifications = [
        NotificationItem(title: "Experiment completed successfully", time: "2 hours ago", actionText: "View"),
        NotificationItem(title: "New gene sequence uploaded", time: "Yesterday", actionText: "Check"),
        NotificationItem(title: "Server maintenance scheduled", time: "2 days ago", actionText: nil),
        NotificationItem(title: "Workflow error detected", time: "Last week", actionText: "Resolve"),
        NotificationItem(title: "New collaboration request received", time: "Last month", actionText: "View")
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Notifications")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 10)

            ScrollView {
                VStack(spacing: 15) {
                    ForEach(notifications) { notification in
                        NotificationRow(notification: notification)
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

// 模型
struct NotificationItem: Identifiable {
    let id = UUID()
    let title: String
    let time: String
    let actionText: String?
}

// 通知行视图
struct NotificationRow: View {
    let notification: NotificationItem

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(notification.title)
                    .font(.headline)
                    .foregroundColor(.black)
                Text(notification.time)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()

            if let actionText = notification.actionText {
                Button(action: {
                    // 处理按钮点击操作
                }) {
                    Text(actionText)
                        .foregroundColor(.white)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 15)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}

// 预览
struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
            .preferredColorScheme(.light)
    }
}
