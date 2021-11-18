//: [Previous](@previous)

import Foundation

// Sets don't remember the order we add thing and they don't allow duplicates.

var actors = Set(["Denzel Washington", "Tom Cruise", "Nicolas Cage", "Samuel L Jackson"])
print(actors)

actors.insert("Lea Seydoux")
print(actors)

print(actors.contains("Lea Seydoux"))

//: [Next](@next)
