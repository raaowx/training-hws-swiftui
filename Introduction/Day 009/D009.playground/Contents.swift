import Cocoa

func greetUser() {
  print("Hi there!")
}
greetUser()
var greetCopy: () -> Void = greetUser
greetCopy()

let sayHello = {
  print("Hi there!")
}
sayHello()

let sayHello2 = { (name: String) -> String in
  "Hi \(name)!"
}
let greet = sayHello2("Taylor")
print(greet)

func test() -> () {
  print("This is a test!")
}
test()

func getUserData(for id: Int) -> String {
  if id == 1989 {
    return "Taylor Swift"
  } else {
    return "Anonymous"
  }
}
let data: (Int) -> String = getUserData
let data2: (Int) -> String = getUserData(for:)
let user = data(1989)
let user2 = data2(1970)
print(user, user2)


let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()

func captainFirstSorted(name1: String, name2: String) -> Bool {
  if name1 == "Suzanne" {
    return true
  } else if name2 == "Suzanne" {
    return false
  }
  return name1 < name2
}

let captainFirstTeam = team.sorted(by: captainFirstSorted)
let captainFirstTeam2 = team.sorted(by: captainFirstSorted(name1:name2:))
let captainFirstTeam3 = team.sorted { (name1: String, name2: String) -> Bool in
  if name1 == "Suzanne" {
    return true
  } else if name2 == "Suzanne" {
    return false
  }
  return name1 < name2
}
let captainFirstTeam4 = team.sorted { a, b in
  if a == "Suzanne" {
    return true
  } else if b == "Suzanne" {
    return false
  }
  return a < b
}
let captainFirstTeam5 = team.sorted {
  if $0 == "Suzanne" {
    return true
  } else if $1 == "Suzanne" {
    return false
  }
  return $0 < $1
}

print(sortedTeam)
print(captainFirstTeam)
print(captainFirstTeam2)
print(captainFirstTeam3)
print(captainFirstTeam4)
print(captainFirstTeam5)



// --- --- ---

let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)

// --- --- ---

func makeArray(size: Int, using generator: () -> Int) -> [Int] {
  var numbers = [Int]()
  for _ in 0..<size {
    let newNumber = generator()
    numbers.append(newNumber)
  }
  return numbers
}

let rolls = makeArray(size: 50) {
  Int.random(in: 1...20)
}
print(rolls)
func generateNumber() -> Int {
  Int.random(in: 1...20)
}
let newRolls = makeArray(size: 50, using: generateNumber)
print(newRolls)

func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
  print("About to start first work.")
  first()
  print("About to start second work.")
  second()
  print("About to start third work.")
  third()
  print("Done")
}
doImportantWork {
  print("This is the first work")
} second: {
  print("This is the second work")
} third: {
  print("This is the third work")
}

// --- --- ---

// Checkpoint 5
//
// Given the 'luckyNumbers' array perform the following job:
// 1.- Filter out any numbers that are even
// 2.- Sort the array in ascending order
// 3.- Map them to strings in the format "NUMBER is a lucky number"
// 4.- Print the resulting array, one item per line

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
luckyNumbers.filter { $0 % 2 != 0 }.sorted().map { "\($0) is a lucky number" }.forEach { print($0) }
