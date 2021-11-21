//: [Previous](@previous)

import Foundation

class Animal {
    var numberOfLegs: Int
    
    init(numberOfLegs: Int) {
        self.numberOfLegs = numberOfLegs
    }
}

class Dog: Animal {
    override init(numberOfLegs: Int) {
        super.init(numberOfLegs: numberOfLegs)
    }
    
    func speak() {
        print("Woof")
    }
}

class Porgi: Dog {
    override init(numberOfLegs: Int) {
        super.init(numberOfLegs: numberOfLegs)
    }
    
    override func speak() {
        print("Wooooooof")
    }
}

class Poodle: Dog {
    override init(numberOfLegs: Int) {
        super.init(numberOfLegs: numberOfLegs)
    }
    
    override func speak() {
        print("Woof Woof Woof")
    }
}

let porgi = Porgi(numberOfLegs: 4)
let poodle = Poodle(numberOfLegs: 4)

porgi.speak()
poodle.speak()

print()

class Cat: Animal {
    var isTame: Bool
    
    init(isTame: Bool, numberOfLegs: Int) {
        self.isTame = isTame
        super.init(numberOfLegs: numberOfLegs)
    }
    
    func speak() {
        print("Meow")
    }
}

class Persian: Cat {
    override init(isTame: Bool, numberOfLegs: Int) {
        super.init(isTame: isTame, numberOfLegs: numberOfLegs)
    }
    
    override func speak() {
        print("Meow Meow")
    }
}

class Lion: Cat {
    override init(isTame: Bool, numberOfLegs: Int) {
        super.init(isTame: isTame, numberOfLegs: numberOfLegs)
    }
    
    override func speak() {
        print("Arrrrrghhhh")
    }
}

let persian = Persian(isTame: true, numberOfLegs: 4)
let lion = Lion(isTame: true, numberOfLegs: 4)

persian.speak()
lion.speak()

//: [Next](@next)
