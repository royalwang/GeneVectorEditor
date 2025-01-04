//
//  ChecklistItem.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/4/25.
//

import SwiftUI

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


struct ChecklistItem_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 10) {
            ChecklistItem(title: "Northstar Goal", progress: "1 of 3 steps completed", time: "About 6 mins", isCompleted: false)
            ChecklistItem(title: "Business Areas", progress: "0 of 2 steps completed", time: "About 2 mins", isCompleted: false)
            ChecklistItem(title: "Capabilities", progress: "0 of 2 steps completed", time: "About 5 mins", isCompleted: false)
            ChecklistItem(title: "Activities", progress: "2 of 2 steps completed", time: "About 8 mins", isCompleted: true)
            ChecklistItem(title: "Technologies", progress: "2 of 2 steps completed", time: "About 3 mins", isCompleted: true)
        }
    }
}
