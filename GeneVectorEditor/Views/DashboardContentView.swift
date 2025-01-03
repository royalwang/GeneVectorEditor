//
//  DashboardContentView.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/3/25.
//

import SwiftUI

// 主区域的内容视图（示例）
struct DashboardContentView: View {
    var body: some View {
        // Main Content
        VStack(alignment: .leading, spacing: 20) {
            // Header
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Dashboard")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("We guide businesses towards operational clarity amidst the ever-expanding technology landscape.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }

                Spacer()

                HStack(spacing: 10) {
                    Button("Roadmap") {}
                        .buttonStyle(PrimaryButtonStyle())
                    Button("Help") {}
                        .buttonStyle(SecondaryButtonStyle())
                    Button("Docs") {}
                        .buttonStyle(SecondaryButtonStyle())
                }
            }

            // Stats Overview
            HStack {
                StatCard(title: "6", subtitle: "Business Area")
                StatCard(title: "14", subtitle: "Capabilities")
                StatCard(title: "59", subtitle: "Activities")
                StatCard(title: "17", subtitle: "Technologies")
            }

            // Getting Started Section
            VStack(alignment: .leading, spacing: 15) {
                Text("Gene Sequences")
                    .font(.title2)
                    .fontWeight(.bold)

                ProgressBar(progress: 0.25)

                VStack(spacing: 10) {
//                    ChecklistItem(title: "Northstar Goal", progress: "1 of 3 steps completed", time: "About 6 mins", isCompleted: false)
//                    ChecklistItem(title: "Business Areas", progress: "0 of 2 steps completed", time: "About 2 mins", isCompleted: false)
//                    ChecklistItem(title: "Capabilities", progress: "0 of 2 steps completed", time: "About 5 mins", isCompleted: false)
//                    ChecklistItem(title: "Activities", progress: "2 of 2 steps completed", time: "About 8 mins", isCompleted: true)
//                    ChecklistItem(title: "Technologies", progress: "2 of 2 steps completed", time: "About 3 mins", isCompleted: true)
                    GeneListView()
                        
                }
            }

            Spacer()
        }
        .padding()
    }
}

struct StatCard: View {
    let title: String
    let subtitle: String

    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Text(subtitle)
                .font(.caption)
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.blue)
        .cornerRadius(10)
    }
}

struct ProgressBar: View {
    let progress: CGFloat

    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(height: 10)
                .foregroundColor(.gray.opacity(0.2))
            Rectangle()
                .frame(width: progress * UIScreen.main.bounds.width, height: 10)
                .foregroundColor(.blue)
        }
        .cornerRadius(5)
    }
}

struct ChecklistItem: View {
    let title: String
    let progress: String
    let time: String
    let isCompleted: Bool

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .fontWeight(.bold)
                Text(progress)
                    .font(.caption)
                    .foregroundColor(.gray)
                Text(time)
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
            Spacer()
            Button(isCompleted ? "Completed" : "Start") {}
                .buttonStyle(PrimaryButtonStyle())
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

struct SecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.gray.opacity(0.2))
            .foregroundColor(.blue)
            .cornerRadius(10)
    }
}
