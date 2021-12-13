//
//  ColorCyclingRectangle.swift
//  Drawing
//
//  Created by Juan Diego Ocampo on 13/12/21.
//

import SwiftUI

struct ColorCyclingRectangle: View {
    
    var amount = 0.0
    var steps = 100
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                color(for: value, brightness: 1),
                                color(for: value, brightness: 0.5)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        lineWidth: 2
                    )
            }
        }
        .drawingGroup()
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount
        if targetHue > 1 {
            targetHue -= 1
        }
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
    
}


struct ColorCyclingRectangleContentView: View {
    
    @State private var colorRectangle = 0.0
    
    var body: some View {
        VStack {
            ColorCyclingRectangle(amount: colorRectangle)
                .frame(width: 300, height: 300)
            Slider(value: $colorRectangle)
        }
    }
    
}

