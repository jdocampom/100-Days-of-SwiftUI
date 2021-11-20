//: [Previous](@previous)

import Foundation

struct Car {
    let model: String
    let seatCount: Int
    private(set) var currentGear = 1

    enum GearDirection {
        case up, down, neutral
    }

    public mutating func changeGear(_ direction: GearDirection) {
        switch direction {
        case .down : currentGear -= 1
            if currentGear < 0 {currentGear = 0}
        case .up :   currentGear += 1
            if currentGear > 8 { currentGear = 8 }
        case .neutral:
            currentGear = 0  // arbitrary selection
        }
        print("The \(model) is in gear: \(currentGear)")
    }
    
}

var f1 = Car(model: "Ferrari SF-71H", seatCount: 1, currentGear: 4)

f1.changeGear(.up)
f1.changeGear(.down)
f1.changeGear(.neutral)

//: [Next](@next)
