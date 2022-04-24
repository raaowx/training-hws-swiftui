import Foundation

let filename = "paris.jpg"
print(filename.hasSuffix(".jpg"))

let number = 120
print(number.isMultiple(of: 3))

let goodDogs = true
var gameOver = false
print(gameOver)
gameOver.toggle()
print(gameOver)

let isMultiple = 120.isMultiple(of: 3)

var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)

// --- --- ---

let firstPart = "Hello, "
let secondPart = "world!"
let greeting = firstPart + secondPart

let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action

let luggageCode = "1" + "2" + "3" + "4" + "5"

let quote = "Then he tapped a sign saying \"Believe\" and walked away."

let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I'm \(age) years old."
print(message)

let number2 = 11
//let missionMessage = "Apollo " + number + " landed on the moon."
//let missionMessage = "Apollo " + String(number) + " landed on the moon."
let missionMessage = "Apollo \(number2) landed on the moon."

print("5 x 5 is \(5 * 5)")

// --- --- ---

// Checkpoint 1

let celsius = 22.0
let fahrenheit = celsius * 9 / 5 + 32
print("The temperature now is \(celsius)ºC. This is the same as \(fahrenheit)ºF.")

// --- --- ---

// Super-powered string interpolation inSwift 5.0

// Swift 1.0
let age2 = 38
print("You are \(age)")

// Swift 2.1
var user: String?
print("Hi, \(user ?? "Anonymous")")

// Swift 5.0
extension String.StringInterpolation {
  mutating func appendInterpolation(format value: Int) {
    let formatter = NumberFormatter()
    formatter.numberStyle = .spellOut

    if let result = formatter.string(from: value as NSNumber) {
      appendLiteral(result)
    }
  }

  mutating func appendInterpolation(_ value: Date) {
    let formatter = DateFormatter()
    formatter.dateStyle = .full

    let dateString = formatter.string(from: value)
    appendLiteral(dateString)
  }

  mutating func appendInterpolation(twitter: String) {
    appendLiteral("<a href=\"https://twitter.com/\(twitter)\">@\(twitter)</a>")
  }

  mutating func appendInterpolation(format value: Int, using style: NumberFormatter.Style) {
    let formatter = NumberFormatter()
    formatter.numberStyle = style

    if let result = formatter.string(from: value as NSNumber) {
      appendLiteral(result)
    }
  }

  mutating func appendInterpolation(_ values: [String], empty defaultValue: @autoclosure () -> String) {
    if values.count == 0 {
      appendLiteral(defaultValue())
    } else {
      appendLiteral(values.joined(separator: ", "))
    }
  }

  mutating func appendInterpolation(if condition: @autoclosure () -> Bool, _ literal: StringLiteralType) {
    guard condition() else { return }
    appendLiteral(literal)
  }
}

let ageWithNewInterpolation = 38
print("Hi, I'm \(ageWithNewInterpolation)")
print("Hi, I'm \(format: ageWithNewInterpolation)")
print("Today's date is \(Date())")
print("You should follow me on Twitter: \(twitter: "raaowx")")
print("Hi, I'm \(format: ageWithNewInterpolation, using: .spellOut)")

let names = ["Malcom", "Jayne", "Kaylee"]
print("Crew: \(names, empty: "No one").")

extension Array where Element == String {
  func formatted(empty defaultValue: @autoclosure () -> String) -> String {
    if count == 0 {
      return defaultValue()
    } else {
      return self.joined(separator: ", ")
    }
  }
}

print("Crew: \(names.formatted(empty: "No one")).")

var doesSwiftRock = true
print("Swift rocks: \(if: doesSwiftRock, "(*)")")
doesSwiftRock.toggle()
print("Swift rocks: \(if: doesSwiftRock, "(*)")")
print("Swift rocks: \(doesSwiftRock ? "(*)" : "")")

struct Person: Encodable {
  var type: String
  var action: String
}

extension String.StringInterpolation {
  mutating func appendInterpolation(_ person: Person) {
    appendLiteral("I'm a \(person.type) and I'm gonna \(person.action)")
  }

  mutating func appendInterpolation(_ person: Person, count: Int) {
    let action = String(repeating: "\(person.action) ", count: count)
    appendLiteral("\n\(person.type.capitalized)s gonna \(action)")
  }
}

let hater = Person(type: "Hater", action: "hate")
print("Status check: \(hater)")
print(hater)

let player = Person(type: "player", action: "play")
let heartBreaker = Person(type: "heart-breaker", action: "break")
let faker = Person(type: "faker", action: "fake")
print("Let's sing: \(player, count: 5) \(hater, count: 5) \(heartBreaker, count: 5) \(faker, count: 5)")

extension String.StringInterpolation {
  mutating func appendInterpolation<T: Encodable>(debug value: T) {
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted

    if let result = try? encoder.encode(value) {
      let str = String(decoding: result, as: UTF8.self)
      appendLiteral(str)
    }
  }
  mutating func appendInterpolation<T: Encodable>(debugThrows value: T) throws {
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted

    let result = try encoder.encode(value)
    let str = String(decoding: result, as: UTF8.self)
    appendLiteral(str)
  }
}

print("Here's some date: \(debug: faker).")
do {
   print(try "Here's some date: \(debugThrows: faker).")
} catch {
  print(error)
}
