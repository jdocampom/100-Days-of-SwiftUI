//
//  AnimatedBindingsContentView.swift
//  AnimationSwiftUI
//
//  Created by Juan Diego Ocampo on 10/25/21.
//

import SwiftUI

struct AnimatedBindingsContentView: View {
    
    @State private var animationAmount: CGFloat = 1

    var body: some View {
        print(animationAmount)
        return VStack {
            Stepper("Scale amount", value: $animationAmount.animation(
                Animation.easeInOut(duration: 1)
                    .repeatCount(3, autoreverses: true)
            ), in: 1...10)

            Spacer()

            Button("Tap Me") {
                self.animationAmount += 1
            }
            .padding(40)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
    }
    
}
