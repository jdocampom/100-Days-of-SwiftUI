//
//  Arc.swift
//  Drawing
//
//  Created by Juan Diego Ocampo on 12/13/21.
//

import SwiftUI

struct Arc: InsettableShape {
    
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    var insetAmount = 0.0

    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX,
                                    y: rect.midY),
                                    radius: rect.width / 2 - insetAmount,
                                    startAngle: modifiedStart,
                                    endAngle: modifiedEnd,
                                    clockwise: !clockwise)
        return path
    }

    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
    
}
