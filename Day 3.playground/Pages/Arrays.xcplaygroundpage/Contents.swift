//: [Previous](@previous)

import Foundation

var beatles = ["John", "Paul", "George"]
var numbers = [4, 8, 15, 16, 23, 42]
var temperatures = [21.1, 19.5, 14.3, 32.6]

print(beatles[0])
print(numbers.last!)
print(temperatures.first!)

beatles += ["Ringo"]
numbers.append(56)
temperatures.insert(26.2, at: temperatures.count)

var integers = Array<Int>(repeating: 1, count: 10)
print(integers.count)

integers += Array<Int>(repeating: 0, count: 5)
print(integers.reversed())
print(integers.removeAll())

//: [Next](@next)
