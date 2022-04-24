import Cocoa

protocol Vehicle {
  var name: String { get }
  var currentPassengers: Int { get set }
  func estimateTime(for distance: Int) -> Int
  func travel(distance: Int)
}

struct Car: Vehicle {
  let name = "Car"
  var currentPassengers = 1

  func estimateTime(for distance: Int) -> Int {
    distance / 50
  }

  func travel(distance: Int) {
//    print("I'm driving \(distance)km")
  }

  func openSunroof() {
//    print("It's a nice day!")
  }
}

struct Bicycle: Vehicle {
  let name = "Bicycle"
  var currentPassengers = 1

  func estimateTime(for distance: Int) -> Int {
    distance / 10
  }

  func travel(distance: Int) {
//    print("I'm cycling \(distance)km")
  }
}

func commute(distance: Int, using vehicle: Vehicle) {
  if vehicle.estimateTime(for: distance) > 100 {
//    print("That's too slow! I'll try a different vehicle.")
  } else {
    vehicle.travel(distance: distance)
  }
}

func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
  for vehicle in vehicles {
    let estimate = vehicle.estimateTime(for: distance)
//    print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
  }
}

let car = Car()
commute(distance: 100, using: car)

let bike = Bicycle()
commute(distance: 50, using: bike)

getTravelEstimates(using: [car, bike], distance: 150)

// --- --- ---

//func getRandomNumber() -> Int {
func getRandomNumber() -> some Equatable {
//  Int.random(in: 1...6)
  Double.random(in: 1...6)
}

//func getRandomBool() -> Bool {
func getRandomBool() -> some Equatable {
  Bool.random()
}

//print(getRandomNumber() == getRandomNumber())

// --- --- ---

protocol Tree {
  var age: Int { get set }
}

protocol Deciduous { }
protocol Evergreen { }

struct Pine: Tree, Evergreen {
  var age: Int
}

struct Eucalyptus: Tree, Evergreen {
  var age: Int
}

struct Maple: Tree, Deciduous {
  var age: Int
}

struct Oak: Tree, Deciduous {
  var age: Int
}

let forest: [Tree] = [
  Pine(age: 25),
  Pine(age: 35),
  Eucalyptus(age: 13),
  Eucalyptus(age: 37),
  Maple(age: 17),
  Maple(age: 41),
  Oak(age: 24),
  Oak(age: 6)
]

func fallLeaves(forest: [Tree]) -> [Deciduous] {
  forest.compactMap { $0 as? Deciduous }
}

fallLeaves(forest: forest).forEach { print("\($0)") }

// --- --- ---

extension String {
  func trimmed() -> String {
    self.trimmingCharacters(in: .whitespacesAndNewlines)
  }

  mutating func trim() {
    self = self.trimmed()
  }

  var lines: [String] {
    self.components(separatedBy: .newlines)
  }
}

var quote = "   The truth is rarely pure and never simple   "
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)
let trimmed2 = quote.trimmed()
quote.trim()

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""
lyrics.lines.count

struct Book {
  let title: String
  let pageCount: Int
  let readingHours: Int
}

extension Book {
  // Al añadir el inicializador en la extensión no se pierde el inicializador por defecto de la Struct.
  init(title: String, pageCount: Int) {
    self.title = title
    self.pageCount = pageCount
    self.readingHours = pageCount / 50
  }
}

let lotr = Book(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)
let myBook = Book(title: "My Book", pageCount: 2500)

// --- --- ---

//extension Array {
extension Collection { // Array, Set, Dictionary
  var isNotEmpty: Bool {
    isEmpty == false
  }
}

let guests = ["Mario", "Luigi", "Peach"]
if guests.isNotEmpty {
//  print("Guest count: \(guests.count)")
}

protocol Person {
  var name: String { get }
  func sayHello()
}

extension Person {
  func sayHello() {
//    print("Hi, I'm \(name)")
  }
}

struct Employee: Person {
  let name: String
}

let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()

struct Student: Person {
  let name: String

  func sayHello() {
//    print("What's up! I'm \(name)")
  }
}

let samuel = Student(name: "Samuel L. Jackson")
samuel.sayHello()

// --- --- ---

protocol Building {
  var rooms: Int { get }
  var cost: Int { get set }
  var agent: String { get set }

  func summary()
}

struct House: Building {
  let rooms: Int
  var cost: Int
  var agent: String

  func summary() {
//    print("\(agent) say: This house has \(rooms) rooms and it cost \(cost)$")
  }
}

struct Office: Building {
  let rooms: Int
  var cost: Int
  var agent: String

  func summary() {
//    print("\(agent) say: This office has \(rooms) rooms and it cost \(cost)$")
  }
}

let houseOne = House(rooms: 2, cost: 250_000, agent: "Rick")
let officeOne = Office(rooms: 25, cost: 2_500_000, agent: "Lisa")
houseOne.summary()
officeOne.summary()
