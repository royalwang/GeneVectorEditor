//
//  HelpView.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/3/25.
//


import SwiftUI

struct HelpView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // 标题
            Text("Help")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 10)

            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    // FAQ Section
                    HelpSection(title: "FAQ (Frequently Asked Questions)") {
                        HelpRow(icon: "questionmark.circle", title: "How to use the app?", destination: Text("Guide on how to use the app"))
                        HelpRow(icon: "arrow.clockwise", title: "How to update my data?", destination: Text("Guide on updating your data"))
                        HelpRow(icon: "trash", title: "How to delete my account?", destination: Text("Guide on deleting your account"))
                    }

                    // Support Section
                    HelpSection(title: "Support") {
                        HelpRow(icon: "envelope", title: "Contact Support", destination: Text("Contact support details"))
                        HelpRow(icon: "phone", title: "Call Us", destination: Text("Call us details"))
                    }

                    // User Guide Section
                    HelpSection(title: "User Guide") {
                        HelpRow(icon: "doc.text.magnifyingglass", title: "Getting Started", destination: Text("Getting started guide"))
                        HelpRow(icon: "book", title: "Advanced Features", destination: Text("Advanced features guide"))
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

// 通用帮助分组
struct HelpSection<Content: View>: View {
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

// 帮助项视图
struct HelpRow<Destination: View>: View {
    let icon: String
    let title: String
    let destination: Destination

    var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.blue)
                    .frame(width: 24)
                Text(title)
                    .font(.body)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 5)
        }
    }
}

// 预览
struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HelpView()
        }
        .preferredColorScheme(.light)
    }
}
