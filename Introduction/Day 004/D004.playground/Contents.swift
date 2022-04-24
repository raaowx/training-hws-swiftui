import Cocoa

let surname: String = "Lasso"
var score: Double = 0

let playerName: String = "Roy"
let luckyNumber: Int = 13
let pi: Double = 3.14
var isAuthenticated: Bool = true

var albums: [String] = ["Red", "Fearless"]
var user: [String: String] = ["id": "@twostraws"]
var books: Set<String> = Set([
  "The Bluest Eye",
  "Foundation",
  "Girl, Woman, Other"
])

var films: Set<String> = [
  "Harry Potter",
  "Star Wars",
  "The Lord of the Rings",
  "Harry potter", // It is not the same, `potter` is not capitalized.
  "Star Wars" // Removed, it is duplicated
]
//print(films)

var soda: [String] = ["Coke", "Pepsi", "Irn-Bru"]
var teams: [String] =  [String]()
var cities: [String] = []
var clues = [String]()

enum UIStyle {
  case light, dark, system
}

var style = UIStyle.light
style = .dark

var style2: UIStyle = .light
style = .system

let username: String
// Lots of complex logic
username = "@twostraws"
// Lots of more complex logic
//print(username)

// let score2: Int = "Zero" // Won't work... obiously

// --- --- ---

// Checkpoint 2

let watchedFilms = [
  "Star Wars",
  "Harry Potter",
  "Apocalypto",
  "The Lord of the Rings",
  "Harry Potter",
  "Inception",
  "Star Wars",
  "Oblivion",
  "Grease",
  "Batman",
  "Superman",
  "Inception"
]
let uniqueWatchedFilms = Set(watchedFilms)

print("You've watched a total of \(watchedFilms.count) films but only \(uniqueWatchedFilms.count) were unique...")
