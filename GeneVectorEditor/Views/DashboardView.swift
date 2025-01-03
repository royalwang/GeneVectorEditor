//
//  DashboardView.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/3/25.
//


import SwiftUI

struct DashboardView: View {
    var body: some View {
        HStack(spacing: 0) {
            // Sidebar
            SidebarView()
            
//            VStack(alignment: .leading, spacing: 20) {
//                Text("STACKMAP")
//                    .font(.headline)
//                    .foregroundColor(.white)
//                    .padding(.top, 20)
//
//                VStack(alignment: .leading, spacing: 15) {
//                    NavigationLink(destination: Text("Dashboard")) {
//                        Label("Dashboard", systemImage: "house.fill")
//                    }
//                    NavigationLink(destination: Text("Stackmap")) {
//                        Label("Stackmap", systemImage: "map")
//                    }
//                    NavigationLink(destination: Text("Capabilities")) {
//                        Label("Capabilities", systemImage: "gearshape")
//                    }
//                    NavigationLink(destination: Text("Technologies")) {
//                        Label("Technologies", systemImage: "bolt.fill")
//                    }
//                    NavigationLink(destination: Text("Roadmap")) {
//                        Label("Roadmap", systemImage: "calendar")
//                    }
//                }
//                .foregroundColor(.white)
//                .padding(.top, 20)
//
//                Spacer()
//
//                HStack {
//                    Image(systemName: "person.circle")
//                        .foregroundColor(.white)
//                    Text("Daniel Sayer")
//                        .foregroundColor(.white)
//                }
//                .padding(.bottom, 20)
//            }
//            .padding()
//            .frame(width: 200)
//            .background(Color.black)

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
                    Text("Getting Started")
                        .font(.title2)
                        .fontWeight(.bold)

                    ProgressBar(progress: 0.25)

                    VStack(spacing: 10) {
                        ChecklistItem(title: "Northstar Goal", progress: "1 of 3 steps completed", time: "About 6 mins", isCompleted: false)
                        ChecklistItem(title: "Business Areas", progress: "0 of 2 steps completed", time: "About 2 mins", isCompleted: false)
                        ChecklistItem(title: "Capabilities", progress: "0 of 2 steps completed", time: "About 5 mins", isCompleted: false)
                        ChecklistItem(title: "Activities", progress: "2 of 2 steps completed", time: "About 8 mins", isCompleted: true)
                        ChecklistItem(title: "Technologies", progress: "2 of 2 steps completed", time: "About 3 mins", isCompleted: true)
                    }
                }

                Spacer()
            }
            .padding()
        }
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
                .foregroundColor(.gray)
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

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
