//: [Previous](@previous)

import Foundation

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let evenNumbers = luckyNumbers.filter({ $0 % 2 != 0 })
let sortedEvenNumbers = evenNumbers.sorted { $0 < $1 }
let numbers = sortedEvenNumbers.map { "\($0) is a lucky number" }

for number in numbers { print(number) }

//: [Next](@next)
