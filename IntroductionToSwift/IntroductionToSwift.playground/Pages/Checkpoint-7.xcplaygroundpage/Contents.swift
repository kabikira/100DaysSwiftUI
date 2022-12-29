//: [Previous](@previous)

import Foundation

class Animal {
    let legs: Int
    
    init(legs: Int) {
        self.legs = legs
        
    }
}

class Dog: Animal {
    func speak() {
        print("われは犬、\(legs)本の足を持つわーーん")
    }
}

class Cat: Animal {
    var isTame: Bool
    init(legs: Int,isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    func speak() {
        print("われは猫、\(legs)本の足を持つにゃーん")
    }
}

class Corgi: Dog {
    override func speak() {
        print("われはコーギー、\(legs)本の足を持つわんわん")
    }
}

class Poodle: Dog {
    override func speak() {
        print("われはプードル、\(legs)本の足を持つわんお")
    }
}

class Persian: Cat {
    override func speak() {
        print("われPerdian、\(legs)本の足を持つにゃっん")
    }
}

class Lion: Cat {
    override func speak() {
        print("われLion、\(legs)本の足を持つにゃ---ん")
    }

}

let dog = Dog(legs: 4)
dog.speak()

let corgi = Corgi(legs: 4)
corgi.speak()

let poodle = Poodle(legs: 4)
poodle.speak()

let cat = Cat(legs: 4, isTame: true)
cat.speak()

let persian = Persian(legs: 4, isTame: true)
persian.speak()

let lion = Lion(legs: 4, isTame: true)
lion.speak()
