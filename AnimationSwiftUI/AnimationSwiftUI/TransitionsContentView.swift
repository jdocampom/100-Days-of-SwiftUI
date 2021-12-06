//
//  TransitionsContentView.swift
//  AnimationSwiftUI
//
//  Created by Juan Diego Ocampo on 10/25/21.
//

import SwiftUI

struct TransitionsContentView: View {
    
    @State private var isShowingRed = false

    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    self.isShowingRed.toggle()
                }
            }

            if isShowingRed {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
    
}
