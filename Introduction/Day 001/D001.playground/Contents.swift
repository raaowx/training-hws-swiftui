import Cocoa

var greeting = "Hello, playground"

var name = "Ted"
name = "Rebecca"
name = "Keeley"
name = "Mi texto"

let character = "Daphne"
//character = "Eloise"
//character = "Francesca"
// NOTA: Las constantes no pueden cambiarse.

var playerName = "Roy"
print(playerName)

playerName = "Dani"
print(playerName)

playerName = "Sam"
print(playerName)

let managerName = "Michael Scott"
let dogBreed = "Samoyed"
let meaningOfLife = "How many road must a man walk down?"

// === === ===

let actor = "Denzel Washington"
let filename = "paris.jpg"
let result = "⭐️ You win! ⭐️"

let quote = "Then he tapped a sign saying \"Believe\" and walked away."

let movie = """
A day in
the life on an
Apple engineer
"""

print(actor.count)

let nameLength = actor.count
print(nameLength)

print(result.uppercased())

print(movie.hasPrefix("A day"))
print(filename.hasSuffix(".jpg"))

print(movie.hasPrefix("a day"))

// === === ===

let score = 10
//let reallyBig = 100000000
//let reallyBig = 100_000_000
let reallyBig = 1_00__00___00____00

let lowerScore = score - 2
let higherScore = score + 10
let doubledScore = score * 2
let squaredScore = score * score
let halvedScore = score / 2

var counter = 10
//counter = counter + 5
counter += 5
print(counter)

counter *= 2
counter -= 10
counter /= 2

let number = 120
print(number.isMultiple(of: 3))
print(120.isMultiple(of: 3))

// === === ===

let number2 = 0.1 + 0.2
print(number2)

let a = 1
let b = 2.0
//let c = a + b // Type safety
//let c = a + Int(b)
let c = Double(a) + b

let double1 = 3.1
let double2 = 3131.3131
let double3 = 3.0
let int1 = 3

var name2 = "Nicolas Cage"
name2 = "John Travolta"
//name = 57 // Type safety

var rating = 5.0
rating *= 2




