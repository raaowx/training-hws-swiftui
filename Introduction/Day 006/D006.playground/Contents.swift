import UIKit

let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
  print("Swift works great in \(os).")
}

for i in 1...12 {
  print("The \(i) times table")
  for j in 1...12 {
    print("   \(j) x \(i) is \(j * i)")
  }
  print()
}

for i in 1...5 {
  print("Counting from 1 through 5: \(i)")
}

for i in 1..<5 {
  print("Counting from 1 up to 5: \(i)")
}

var lyric = "Haters gonna"
for _ in 1...5 {
  lyric += " hate"
}
print(lyric)

let foo = ["A", "B", "C", "D", "E"]
print(foo[1...3])
print(foo[2...])

// --- --- ---

var countdown = 10
while countdown > 0 {
  print("\(countdown)...")
  countdown -= 1
}
print("Blast off!")

let id = Int.random(in: 1...1000)
let amount = Double.random(in: 0...1)

var roll = 0
while roll != 20 {
  roll = Int.random(in: 1...20)
  print("I rolled a \(roll)")
}
print("Critical hit!")

// --- --- ---

let filenames = ["me.jpg", "work.txt", "sophie.jpg"]

for filename in filenames {
  if !filename.hasSuffix(".jpg") {
    continue
  }
  print("Found picture: \(filename)")
}

let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_000 {
  if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
    multiples.append(i)
    if multiples.count == 10 {
      break
    }
  }
}
print(multiples)

// --- --- ---

for n in 1...100 {
//  let isMultiple: (ofThree: Bool, ofFive: Bool) = (n % 3 == 0 ? true : false, n % 5 == 0 ? true : false)
  // Improvement after seeing the hints
  let isMultiple = (n.isMultiple(of: 3), n.isMultiple(of: 5))
  switch isMultiple {
    case let (a, b) where a && b:
      print("FizzBuzz")
    case let (a, _) where a:
      print("Fizz")
    case let (_, b) where b:
      print("Buzz")
    default:
      print(n)
  }
}
