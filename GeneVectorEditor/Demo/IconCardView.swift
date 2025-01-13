//
//  IconCardView.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 2024/6/5.
//

import SwiftUI

struct IconCardView: View {
    let icon: String
    let title: String
    var backgroundColor: Color = Color.blue
    var cornerRadius: CGFloat = 10
    var action: () -> Void

    @State private var isPressed = false

    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white)
                    .padding()
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
            }
            .padding()
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
            .shadow(radius: 5)
            .scaleEffect(isPressed ? 0.95 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: isPressed)
        }
        .buttonStyle(PlainButtonStyle())
        .onLongPressGesture(minimumDuration: .infinity, pressing: { isPressing in
            withAnimation {
                isPressed = isPressing
            }
        }, perform: {})
    }
}
