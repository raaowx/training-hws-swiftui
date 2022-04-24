import Cocoa

func printTimeTables(for number: Int, end: Int = 12) {
  for i in 1...end {
    print("\(i) x \(number) is \(i * number)")
  }
}

//printTimeTables(for: 5, end: 20)
//printTimeTables(for: 8)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
//print(characters.count)
characters.removeAll(keepingCapacity: true)
//print(characters.count)

// --- --- ---

enum PasswordError: Error {
  case short, obvious
}

func checkPassword(_ password: String) throws -> String {
  if password.count < 5 { throw PasswordError.short }
  if password == "12345" { throw PasswordError.obvious }
  if password.count < 8 {
    return "OK"
  } else if password.count < 10 {
    return "Good"
  } else {
    return "Excellent"
  }
}

let string = "12345"
do {
  let result = try checkPassword(string)
//  print("Password rating: \(result)")
} catch PasswordError.short {
//  print("Please use a longer password.")
} catch PasswordError.obvious {
//  print("I have the same combination on my luggage!")
} catch {
//  print("There was an error.")
}

// --- --- ---

enum SquareRootError: Error {
  case outOfBounds, noRoot
}

func squareRoot(of number: Int) throws -> Int {
  if number > 10_000 || number < 1 {
    throw SquareRootError.outOfBounds
  }
  for n in 1..<number where n * n == number {
    return n
  }
  throw SquareRootError.noRoot
}

let numbers = [0, 81, 532, 1600, 5625, 9999, 10_001]
for number in numbers {
  do {
    print("Starting square root search for number: \(number)")
    let result = try squareRoot(of: number)
    print("Success! The result is: \(result)")
  } catch SquareRootError.noRoot {
    print("[ERROR] No square root found")
  } catch SquareRootError.outOfBounds {
    print("[ERROR] Number is out of bounds")
  }
  print()
}
