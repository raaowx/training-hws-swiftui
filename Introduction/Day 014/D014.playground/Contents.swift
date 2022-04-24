import Cocoa

let opposites = [
  "Mario": "Wario",
  "Luigi": "Waluigi"
]

let peachOpposite = opposites["Peach"]

if let marioOpposite = opposites["Mario"] {
  print("Mario's opposite is \(marioOpposite)")
}

var username: String? = nil

if let unwrappedName = username {
  print("We got a user: \(unwrappedName)")
} else {
  print("The optional was empty.")
}

func square(number: Int) -> Int {
  number * number
}

var number: Int? = nil

//if let unwrappedNumber = number {
if let number = number {
//  print(square(number: unwrappedNumber ))
  print(square(number: number))
}

// --- --- ---

func printSquare(of number: Int?) {
  guard let number = number else {
    print("Missing input")
    return
  }
  print("\(number) x \(number) is \(number * number)")
}

func process() {
  let myVar: Int? = 3
  if let unwrapped = myVar {
    // Run if myVar has a value inside
    print("Value found: \(unwrapped) - Inside if")
  }

  guard let unwrapped = myVar else {
    // Run if myVar doesn't have a value inside
    print("Value not found")
    return
  }
  print("Value found: \(unwrapped) - After guard")
}

// --- --- ---

let captains = [
  "Enterprise": "Picard",
  "Voyager": "Janeway",
  "Defiant": "Sisko"
]

let new = captains["Serenity"] ?? "N/A"
let new2 = captains["Serenity", default: "N/A"]

let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"

struct Book {
  let title: String
  let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)

let input = ""
let number2 = Int(input) ?? 00
print(number2)

// --- --- ---

let names = ["Arya", "Bran", "Robb", "Sansa"]
let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

var book2: Book? = nil
let author2 = book2?.author?.first?.uppercased() ?? "A"
print(author2)

// --- --- ---

enum UserError: Error {
  case badID, networkFailed
}

func getUser(id: Int) throws -> String {
  throw UserError.networkFailed
}

if let user = try? getUser(id: 33) {
  print("User: \(user)")
}

let user = (try? getUser(id: 23)) ?? "Anonymous"
print(user)

// --- --- ---

// Checkpoint 9
func randomItem(from array: [Int]?) -> Int {
  array?.randomElement() ?? Int.random(in: 1...100)
}
var numbers: [Int]?
print("My random item is: \(randomItem(from: numbers))")
numbers = [101, 204, 452, 879, 909]
print("My random item is: \(randomItem(from: numbers))")
