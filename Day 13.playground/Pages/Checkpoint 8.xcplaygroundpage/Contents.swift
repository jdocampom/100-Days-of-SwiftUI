//: [Previous](@previous)

import Foundation

protocol Building {
    var name: String { get set }
    var numberOfRooms: Int { get set }
    var cost: Int { get set }
    var realStateAgent: String { get set }
    
    func printSummary()
}

struct House: Building {
    var name: String
    var numberOfRooms: Int
    var cost: Int
    var realStateAgent: String
    
    func printSummary() {
        print("Building \"\(self.name)\" has \(self.numberOfRooms) rooms and was sold by \(self.realStateAgent) for \(self.cost.formatted()) USD.")
    }
}

let house = House(name: "House 1", numberOfRooms: 4, cost: 350000, realStateAgent: "Tom")
house.printSummary()

print()

struct SkyScrapper: Building {
    var name: String
    var numberOfRooms: Int
    var cost: Int
    var realStateAgent: String
    
    func printSummary() {
        print("Building \"\(self.name)\" has \(self.numberOfRooms) rooms and was sold by \(self.realStateAgent) for \(self.cost.formatted()) millions.")
    }
}

let empireState = House(name: "Empire State", numberOfRooms: 4000, cost: 2500, realStateAgent: "Tom")
empireState.printSummary()

//: [Next](@next)
