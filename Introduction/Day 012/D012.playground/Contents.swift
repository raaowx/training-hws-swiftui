import Cocoa

class Game {
  var score = 0 {
    didSet {
      print("Score is now \(score)")
    }
  }
}

var newGame = Game()
newGame.score += 10

// --- --- ---

class Employee {
  let hours: Int

  init(hours: Int) {
    self.hours = hours
  }

  func printSummary() {
    print("I work \(hours) hours a day.")
  }
}

class Developer: Employee {
  func work() {
    print("I'm writing code for \(hours) hours.")
  }

  override func printSummary() {
    print("I'm a developer who will sometimes work \(hours) hours a day, but other times will spend hours arguing about whether code should be indented using tabs or spaces.")
  }
}

class Manager: Employee {
  func work() {
    print("I'm going to meetings for \(hours) hours.")
  }
}

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
joseph.work()

let novall = Developer(hours: 8)
novall.printSummary()

// --- --- ---

class Vehicle {
  let isElectric: Bool

  init(isElectric: Bool) {
    self.isElectric = isElectric
  }
}

class Car: Vehicle {
  let isConvertible: Bool

  init(isElectric: Bool, isConvertible: Bool) {
    self.isConvertible = isConvertible
    super.init(isElectric: isElectric)
  }
}

class Motorbike: Vehicle {
  var isForCircuit = false
}

let teslaX = Car(isElectric: true, isConvertible: false)
let r1 = Motorbike(isElectric: false)

// --- --- ---

class UserA {
  var username = "Anonymous"

  func copy() -> UserA {
    let user = UserA()
    user.username = self.username
    return user
  }
}

var user1 = UserA()
var user2 = user1
var user3 = user2.copy()
user2.username = "Taylor"
user3.username = "New name"
user1.username
user2.username
user3.username

// --- --- ---

class UserB {
  let id: Int

  init(id: Int) {
    self.id = id
    print("User \(id): I'm alive!")
  }

  deinit {
    print("User \(id): I'm dead!")
  }
}

for i in 1...3 {
  let user = UserB(id: i)
  print("User \(user.id): I'm in control!")
}

var usersB = [UserB]()
for i in 4...7 {
  let user = UserB(id: i)
  print("User \(user.id): I'm in control!")
  usersB.append(user)
}

print("Loop is finished!")
usersB.removeAll()
print("Array is clear!")

// --- --- ---

class UserC {
  var name = "Paul"
}

var userC1 = UserC()
userC1.name = "Taylor"
userC1.name
userC1 = UserC()
userC1.name

// --- --- ---
print("\n\n\n")
// --- --- ---

// Checkpoint 7
class Animal {
  let legs: Int

  init(legs: Int) {
    self.legs = legs
  }
}

class Dog: Animal {
  init() {
    super.init(legs: 4)
  }

  func speak() {
    print("Guau!")
  }
}

class Cat: Animal {
  let isTame: Bool

  init(isTame: Bool) {
    self.isTame = isTame
    super.init(legs: 4)
  }

  func speak() {
    print("Miau!")
  }
}

final class Corgi: Dog {
  override func speak() {
    print("Woof!")
  }
}

final class Poodle: Dog {
  override func speak() {
    print("Wuuf!")
  }
}

final class Persian: Cat {
  override func speak() {
    print("Grrr!")
  }
}

final class Lion: Cat {
  override func speak() {
    print("Metro Goldwyn Mayer")
  }
}

let corgi = Corgi()
let poodle = Poodle()
let persian = Persian(isTame: true)
let lion = Lion(isTame: false)
corgi.speak()
poodle.speak()
persian.speak()
lion.speak()
