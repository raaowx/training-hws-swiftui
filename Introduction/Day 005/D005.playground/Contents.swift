let score = 85

if score > 80 {
  print("Great job!")
}

let speed = 88
let percentage = 85
let age = 18

if speed >= 88 {
  print("Where we're going, we don't need roads.")
}

if percentage < 85 {
  print("Sorry, you failed the test.")
}

if age >= 18 {
  print("You're elegible to vote.")
}

let ourName = "Dave Lister"
let friendName = "Arnold Rimmer"

if ourName < friendName {
  print("It's \(ourName) vs \(friendName)")
}

if ourName > friendName {
  print("It's \(friendName) vs \(ourName)")
}

var numbers = [1, 2, 3]
numbers.append(4)
if numbers.count > 3 {
  numbers.remove(at: 0)
}
//print(numbers)

let country = "Canada"
if country == "Australia" {
  print("G'day!")
}

let name = "Taylor Swift"

if name != "Anonymous" {
  print("Welcome, \(name)")
}

var username = "taylorswift13"
username.removeAll()

//if username == "" {
//if username.count == 0 {
if username.isEmpty {
  username = "Anonymous"
}
print("Welcome, \(username)")

// --- --- ---

struct Motorbike {
  var brand: String
  var model: String
  var hp: Int
}

extension Motorbike: Comparable {
  static func < (lc: Motorbike, rc: Motorbike) -> Bool {
    return lc.hp < rc.hp
  }
}

extension String.StringInterpolation {
  mutating func appendInterpolation(_ value: Motorbike) {
    appendInterpolation("\(value.brand) \(value.model)")
  }
}

let sportGlide = Motorbike(brand: "Harley Davidson", model: "Sport Glide", hp: 82)
let sportsterIron =  Motorbike(brand: "Harley Davidson", model: "Iron 883", hp: 51)
if sportGlide > sportsterIron {
  print("Seems like the \(sportGlide) has more horsepower! 🐎🐎🐎 Be safe out there! 🏍💨")
}

// --- --- ---

let age2 = 16
if age2 >= 18 {
  print("You can vote in the next election.")
} else {
  print("Sorry, you're too young to vote.")
}

//if age < 18 {
//  print("Sorry, you're too young to vote.")
//}

let temp = 25
if temp > 20 && temp < 30 {
  print("It's a nice day")
}

let userAge = 14
let hasParentalConsent = true
if age >= 18 || hasParentalConsent {
  print("You can buy the game!")
}

enum TransportOption {
  case airplane, helicopter, bicycle, car, escooter
}

let transport = TransportOption.airplane

if transport == .airplane || transport == .helicopter {
  print("Let's fly!")
} else if transport == .bicycle {
  print("I hope there's a bike path...")
} else if transport == .car {
  print("Time to get stuck in traffic.")
} else {
  print("I'm going to hire a scooter now!")
}

// --- --- ---

enum Weather {
  case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun

if forecast == .sun {
  print("It should be a nice day.")
} else if forecast == .rain {
  print("Pack an umbrella.")
} else if forecast == .wind {
  print("Wear something warm.")
} else if forecast == .rain {
  print("School is cancelled.")
} else {
  print("Our forecast generator is broken!")
}

switch forecast {
  case .sun:
    print("It should be a nice day.")
  case .rain:
    print("Pack an umbrella.")
  case .wind:
    print("Wear something warm.")
  case .snow:
    print("School is cancelled.")
  case .unknown:
    print("Our forecast generator is broken!")
}

let place = "Metropolis"

switch place {
  case "Gotham":
    print("You're Batman!")
  case "Mega-City One":
    print("You're Judge Dredd!")
  case "Wakanda":
    print("You're Black Panther!")
  default:
    print("Who are you?")
}

let day = 5
print("My true love gave to me...")
switch day {
  case 5:
    print("5 golden rings")
    fallthrough
  case 4:
    print("4 calling birds")
    fallthrough
  case 3:
    print("3 French hens")
    fallthrough
  case 2:
    print("2 turtle doves")
    fallthrough
  default:
    print("A partridge in a pear tree")
}

// --- --- ---

let age3 = 18
let canVote = age >= 18 ? "Yes" : "No"
print(canVote)

let hour = 23
print(hour < 12 ? "It's before noon" : "It's after noon")

let names = ["Jane", "Kaylee", "Mal"]
let crewCount = name.isEmpty ? "No one" : "\(names.count) people"
print(crewCount)

enum Theme {
  case light, dark
}
let theme = Theme.dark
let background = theme == .dark ? "black" : "white"
print(background)

