//
//  CustomAnimationContentView.swift
//  AnimationSwiftUI
//
//  Created by Juan Diego Ocampo on 10/25/21.
//

import SwiftUI

struct CustomAnimationContentView: View {
    
    @State private var animationAmount: CGFloat = 1

    var body: some View {
        Button("Tap Me") {
            // self.animationAmount += 1
        }
        .padding(40)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(Color.red)
                .scaleEffect(animationAmount)
                .opacity(Double(2 - animationAmount))
                .animation(Animation.easeOut(duration: 1).repeatForever(autoreverses: false), value: 0)
        )
        .onAppear {
            self.animationAmount = 2
        }
    }
    
}
