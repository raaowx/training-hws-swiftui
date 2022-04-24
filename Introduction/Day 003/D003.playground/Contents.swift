import Cocoa
import Foundation

var beatles = ["John", "Paul", "George", "Ringo"]
let numbers = [4, 8, 15, 16, 23, 42]
var temperatures = [25.3, 28.2, 26.4]

print(beatles[0])
print(numbers[1])
print(temperatures[2])

beatles.append("Adrian")
beatles.append("Allen")
beatles.append("Adrian")
beatles.append("Novall")
beatles.append("Vivian")

//temperatures.append("Chris") // Fail

let firstBeatle = beatles[0]
let firstNumber = numbers[0]
//let notAllowed = firstBeatle + firstNumber

var score = Array<Int>()
score.append(100)
score.append(80)
score.append(85)
print(score[1])

//var albums = Array<String>()
//var albums = [String]()
var albums = ["Folklore"]
albums.append("Fearless")
albums.append("Red")
print(albums.count)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)

characters.remove(at: 2)
print(characters.count)

characters.removeAll()
print(characters.count)

let bondMovies = ["Casino Royale", "Spectre", "No Time to Die"]
print(bondMovies.contains("Frozen"))

let cities = ["London", "Tokio", "Rome", "Budapest"]
print(cities.sorted())

let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)
print(presidents.first ?? "")
print(reversedPresidents.first ?? "")

// --- --- ---

var employee = ["Taylor Swift", "Singer", "Nashville"]
print("Name: \(employee[0])")
employee.remove(at: 1)
print("Job title: \(employee[1])")
//print("Location: \(employee[2])")

let employee2 = [
  "name": "Taylor Swift",
  "job": "Singer",
  "location": "Nashville"
]
print(employee2["name", default: "Unknown"])
print(employee2["job", default: "Unknown"])
print(employee2["location", default: "Unknown"])
print(employee2["password", default: "Unknown"])
print(employee2["status", default: "Unknown"])
print(employee2["manager", default: "Unknown"])

let hasGraduated = [
  "Eric": false,
  "Maeve": true,
  "Otis": false
]

let olympics = [
  2012: "London",
  2016: "Rio de Janeiro",
  2021: "Tokyo"
]
print(olympics[2012, default: "Unknown"])

var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Shaquille O'Neal"] = 216
heights["LeBron James"] = 206

var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"
archEnemies["Batman"] = "Penguin"

let results = [
  "english": 100,
  "french": 85,
  "geography": 75
]

let historyResult = results["history", default: 0]

// --- --- ---

let actors = Set([
  "Denzel Washington",
  "Tom Cruise",
  "Nicolas Cage",
  "Samuel L Jackson"
])
print(actors)

var actors2 = Set<String>()
actors2.insert("Denzel Washington")
actors2.insert("Tom Cruise")
actors2.insert("Nicolas Cage")
actors2.insert("Samuel L Jackson")
print(actors2)

// --- --- ---

var selected = "Monday"
selected = "Tuesday"
selected = "January"
selected = "Friday " // WARNING: Space at the end

//enum Weekday {
//  case monday
//  case tuesday
//  case wednesday
//  case thursday
//  case friday
//}

enum Weekday {
  case monday, tuesday, wednesday, thursday, friday
}

var day = Weekday.monday
day = .tuesday
//day = Weekday.january
day = Weekday.friday






