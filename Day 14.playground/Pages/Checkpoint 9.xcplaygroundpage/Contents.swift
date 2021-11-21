//: [Previous](@previous)

import Foundation

func randomElement(from array: [Int]?) -> Int {
    return Int(array?.randomElement() ?? Int.random(in: 1...100))
}

print(randomElement(from: [2, 4, 9, 5, 10, 96]))
print(randomElement(from: nil))

//: [Next](@next)
