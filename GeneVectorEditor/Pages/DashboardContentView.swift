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
