//: [Previous](@previous)

import Foundation

var employee = [
    "name": ["John", "Paul", "George"],
    "age": [35, 39, 22],
    "isVaccinated": [true, false, true]
]

print(employee.keys)
print(employee.values)
print(employee.count)

print(employee["name"]?.first!)

employee["name"]! += ["Anne"]

print(employee["name"]!)

employee["city"] = ["Bogota", "London", "Paris", "Tokyo"]

print(employee)

//: [Next](@next)
