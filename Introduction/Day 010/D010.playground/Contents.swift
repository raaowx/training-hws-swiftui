import Cocoa

struct Album {
  let title: String
  let artist: String
  let year: Int

  func printSummary() {
    print("\(title) \(year) by \(artist)")
  }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.title)

red.printSummary()
wings.printSummary()

struct Employee {
  let name: String
  var vacationRemaining = 14

  mutating func takeVacation(days: Int) {
    if vacationRemaining > days {
      vacationRemaining -= days
      print("I'm going on vacation!")
      print("Days remaining: \(vacationRemaining)")
    } else {
      print("Oops! There aren't enough days remaining!")
    }
  }
}

var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
//let archer = Employee(name: "Sterling Archer", vacationRemaining: 14) // Declarar `archer` como constante hace que la siguiente linea falle ya que todas las propiedades se han convertido en constantes.
archer.takeVacation(days: 5)

let kane = Employee(name: "Lana Kane")
let poovey = Employee(name: "Pam Poovey", vacationRemaining: 35)

// --- --- ---

struct Manager {
  let name: String
  var vacationAllocated = 14
  var vacationTaken = 0

  var vacationRemaining: Int {
    get {
      vacationAllocated - vacationTaken
    }

    set {
      vacationAllocated = vacationTaken + newValue
    }
  }
}

var archerManager = Manager(name: "Sterling Archer", vacationAllocated: 14)
archerManager.vacationTaken += 4
archerManager.vacationRemaining
archerManager.vacationRemaining = 5

// --- --- ---

struct Game {
  var score = 0 {
    didSet {
      print("Score is now \(score)")
    }
  }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1


struct App {
  var contacts = [String]() {
    willSet {
      print("Current value is: \(self)")
      print("New value will be: \(newValue)")
    }
    didSet {
      print("There are now \(contacts.count) contacts")
      print("Old value was: \(oldValue)")
    }
  }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")

// --- --- ---

struct Player {
  let name: String
  let number: Int

  init(name: String) {
    self.name = name
    number = Int.random(in: 1...99)
  }
}

let player = Player(name: "Megan R")
player.number

// --- --- ---
struct Alumn {
  let name: String
}

struct HackingWithSwift {
  enum Course {
    case oneHundredDaysOfSwiftUI, oneHundredDaysOfSwift, swiftUiByExample, swiftInSixtySeconds, hackingWithSwift
    var name: String {
      switch self {
        case .oneHundredDaysOfSwiftUI:
          return "100 Days of SwiftUI"
        case .oneHundredDaysOfSwift:
          return "100 Days of Swift"
        case .swiftUiByExample:
          return "SwiftUI by Example"
        case .swiftInSixtySeconds:
          return "Swift in Sixty Seconds"
        case .hackingWithSwift:
          return "Hacking with Swift"
      }
    }
  }

  let alumn: Alumn, course: Course
  let totalDays = 100
  var daysCompleted = 0 {
    didSet {
      print("Congrats! Keep going! 🧑‍💻 🚀")
    }
  }
  var percentage: Int {
    daysCompleted * 100 / totalDays
  }

  mutating func dayCompleted() {
    daysCompleted += 1
  }
}

extension HackingWithSwift {
  init(alumn: Alumn, course: Course, alreadyPerformedDays: Int) {
    self.init(alumn: alumn, course: course)
    self.daysCompleted = alreadyPerformedDays
  }
}

var currentCourse = HackingWithSwift(
  alumn: Alumn(name: "raaowx"),
  course: .oneHundredDaysOfSwiftUI,
  alreadyPerformedDays: 9)
currentCourse.dayCompleted()

print("""
Hi, I'm \(currentCourse.alumn.name)!
I've completed \(currentCourse.percentage)% of the course '\(currentCourse.course.name)'
""")

