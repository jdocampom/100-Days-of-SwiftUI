//: [Previous](@previous)

import Foundation

func computeSquareRoot(_ number: Int) throws -> Int {
    
    enum InvalidInput: Error {
        case nonIntegerRoot, outOfRange
    }
    
    if number < 1 || number > 10_000 {
        throw InvalidInput.outOfRange
    } else if Double(number).squareRoot().truncatingRemainder(dividingBy: 1) != 0 {
        throw InvalidInput.nonIntegerRoot
    } else {
    return Int(Double(number).squareRoot())
    }
}

for number in [4, -9, 10] {
    do {
        try print(computeSquareRoot(number))
    } catch {
        print("Error: \(error)")
    }
}

//: [Next](@next)
