import Cocoa

func showWelcome() {
  print("Welcome to my app!")
  print("By default This prints out a conversion")
  print("chart from centimeters to inches, but you")
  print("can also set a custom range if you want.")
}

showWelcome()

func printTimesTables(number: Int, end: Int) {
  for i in 1...end {
    print("\(i) * \(number) is \(i * number)")
  }
}

printTimesTables(number: 5, end: 20)

// --- --- ---

let root = sqrt(169)
print(root)

func rollDice() -> Int {
  return Int.random(in: 1...6)
}

let result = rollDice()
print(result)

func containsTheSameLetters(str1: String, str2: String) -> Bool {
  return str1.lowercased().sorted() == str2.lowercased().sorted()
}

let test1 = containsTheSameLetters(str1: "Madrid", str2: "Toronto")
let test2 = containsTheSameLetters(str1: "Adam", str2: "DAMA")
let test3 = containsTheSameLetters(str1: "avion", str2: "novia")
let test4 = containsTheSameLetters(str1: "yeah", str2: "foo!")

func pythagoras(a: Double, b: Double) -> Double {
  sqrt(a * a + b * b)
}

pythagoras(a: 3, b: 4)

// --- --- ---

func getUser() -> [String] {
  ["Taylor", "Swift"]
}
let user = getUser()
print("Name: \(user[0]) \(user[1])")


func getUserDic() -> [String: String] {
  ["firstName": "Taylor", "lastName": "Swift"]
}
let userDic =  getUserDic()
print("Name: \(userDic["firstName", default: "?"]) \(userDic["lastName", default: "?"])")


func getUserTuple() -> (firstName: String,  lastName: String) {
  (firstName: "Taylor", lastName: "Swift")
}
let userTuple = getUserTuple()
print("Name: \(userTuple.firstName) \(userTuple.lastName)")

func getUserTuple2() -> (firstName: String, lastName: String) {
  ("Taylor", "Swift")
}
let userTuple2 = getUserTuple2()
print("Name: \(userTuple2.firstName) \(userTuple2.lastName)")
let (firstName, lastName) = getUserTuple2()
print("Name: \(firstName) \(lastName)")
let (firstName2, _) = getUserTuple2()
print("Hello \(firstName2)!")

func getUserTuple3() -> (String, String) {
  ("Taylor", "Swift")
}
let userTuple3 = getUserTuple3()
print("Name: \(userTuple3.0) \(userTuple3.1)")

// --- --- ---

func rollDice(sides: Int, count: Int) ->  [Int] {
  var rolls = [Int]()
  for _ in 1...count {
    rolls.append(Int.random(in: 1...sides))
  }
  return rolls
}

let rolls = rollDice(sides: 6, count: 4)

func hireEmployee(name: String) { }
func hireEmployee(title: String) { }
func hireEmployee(location: String) { }

let lyric = "I see a red door and I want it painted black."
print(lyric.hasPrefix("I see"))

func isUppercase(_ string: String) -> Bool {
  string == string.uppercased()
}

let string = "HELLO, WORLD"
let result1 = isUppercase(string)

func printTimesTable(for number: Int) {
  for i in 1...12 {
    print("\(i) x \(number) is \(i * number)")
  }
}
printTimesTable(for: 5)

