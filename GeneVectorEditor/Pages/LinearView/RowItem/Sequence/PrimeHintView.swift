//
//  PrimeHintView.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/14/25.
//


import SwiftUI

struct PrimeHintView: View {
    var fivePrimeThreePrimeHints: Bool
    var isReverse: Bool
    
    var body: some View {
        HStack {
            if fivePrimeThreePrimeHints {
                // 3' Direction
                Text("3'")
                    .padding()
                    .background(isReverse ? Color.blue : Color.green)
                    .cornerRadius(5)
                    .frame(maxWidth: .infinity, alignment: isReverse ? .leading : .trailing)
                
                // 5' Direction
                Text("5'")
                    .padding()
                    .background(isReverse ? Color.green : Color.blue)
                    .cornerRadius(5)
                    .frame(maxWidth: .infinity, alignment: isReverse ? .trailing : .leading)
            }
        }
        .padding()
    }
}

struct PrimeHintView_ContentView: View {
    @State private var fivePrimeThreePrimeHints = true
    @State private var isReverse = false
    
    var body: some View {
        VStack {
            PrimeHintView(fivePrimeThreePrimeHints: fivePrimeThreePrimeHints, isReverse: isReverse)
            
            Button("Toggle Reverse") {
                isReverse.toggle()
            }
        }
    }
}

struct PrimeHintView_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PrimeHintView_ContentView()
    }
}
