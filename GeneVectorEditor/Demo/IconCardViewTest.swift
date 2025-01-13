//
//  IconCardViewTest.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 2024/6/5.
//

import SwiftUI

struct IconCardViewTest: View {
    var body: some View {
        VStack {
            IconCardView(icon: "star.fill", title: "Favorites", backgroundColor: .purple) {
                print("Favorites tapped")
            }
            IconCardView(icon: "heart.fill", title: "Liked", backgroundColor: .red) {
                print("Liked tapped")
            }
            IconCardView(icon: "clock.fill", title: "Recent", backgroundColor: .green) {
                print("Recent tapped")
            }
        }
        .padding()
    }
}

struct IconCardViewTest_Previews: PreviewProvider {
    static var previews: some View {
        IconCardViewTest()
    }
}
