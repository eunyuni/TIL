import UIKit

var str = "Hello, playground"

class Animal {
    var branin = true
    var legs = 0
}

class Human: Animal {
    override var legs: Int {
        get {
            return super.legs
        }
        set {
            super.legs = newValue
        }
    }
}

// Human
let human = Human()
human.legs = 2
human.legs

class Pet: Animal {
        var fleas = 0
    override var legs: Int {
        get {
            return super.legs
        }
        set {
            super.legs = newValue
        }
    }
}

// Pet
let pet = Pet()
pet.legs = 4
pet.legs
pet.fleas

class Dog: Pet {
    override var legs: Int {
        get {
            return super.fleas
        }
        set {
            super.fleas = newValue
        }
    }
}

// Dog
let dog = Dog()
dog.fleas = 8
dog.fleas

class Cat: Pet {
    override var legs: Int {
        get {
            return super.fleas
        }
        set {
            super.fleas = newValue
        }
    }
}

// Cat
let cat = Cat()
cat.fleas = 4
cat.fleas
