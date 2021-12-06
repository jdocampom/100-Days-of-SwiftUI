//
//  ControllingTheAnimationStackContentView.swift
//  AnimationSwiftUI
//
//  Created by Juan Diego Ocampo on 10/25/21.
//

import SwiftUI

struct ControllingTheAnimationStackContentView: View {
    
    @State private var enabled = false

    var body: some View {
        Button("Tap Me") {
            self.enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? Color.blue : Color.red)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        .animation(Animation.interpolatingSpring(stiffness: 10, damping: 1), value: 0)
    }
    
}
