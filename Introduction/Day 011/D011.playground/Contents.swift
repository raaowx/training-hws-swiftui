import Cocoa

struct BankAccount {
  private(set) var funds = 0

  mutating func deposit(amount: Int) {
    funds += amount
  }

  mutating func withdraw(amount: Int) -> Bool {
    if funds > amount {
      funds -= amount
      return true
    } else {
      return false
    }
  }
}

var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)
if success {
//  print("Withdrew money successfully")
} else {
//  print("Failed to get the money")
}

// --- --- ---

struct School {
  static var studentCount = 0

  static func add(student: String) {
//    print("\(student) joined the school.")
    studentCount += 1
  }
}

School.add(student: "Taylor Swift")
//print(School.studentCount)

struct AppData {
  static let version = "1.3 beta 2"
  static let saveFilename = "settings.json"
  static let homeURL = "https://www.hackingwithswift.com"
}

AppData.version

struct Employee {
  let username: String
  let password: String

  static let example = Employee(username: "cfederighi", password: "h4irf0rce0ne")
}

// --- --- ---

// Checkpoint 6
struct Car {
  static let gearRange = 1...10
  private(set) var gear: Int = 1 {
    willSet {
      print("\(newValue > gear ? GearChange.up.rawValue : GearChange.down.rawValue)")
    }
    didSet {
      print("Gear change completed! Current gear: \(gear). Let's go \(oldValue < gear ? "faster" : "slower")")
    }
  }
  let model: String
  let seats: Int

  enum GearChange: String {
    case up = "Upshifting"
    case down = "Downshifting"
  }

  init(model: String, seats: Int) {
    self.model = model
    self.seats = seats
    print("Welcome! I'm a \(self.model) and I'm your car. Drive safe!")
  }

  @discardableResult
  mutating func changeGear(_ change: GearChange) -> Bool {
    switch change {
      case .up:
        guard Self.gearRange.contains(gear + 1) else {
          print("There isn't more gears up!")
          return false
        }
        gear += 1
        return true
      case .down:
        guard Self.gearRange.contains(gear - 1) else {
          print("There isn't more gears down!")
          return false
        }
        gear -= 1
        return true
    }
  }
}

var honda = Car(model: "Civic", seats: 5)
honda.changeGear(.down)
honda.changeGear(.up)
honda.changeGear(.up)
honda.changeGear(.up)
honda.changeGear(.up)
honda.changeGear(.down)
honda.changeGear(.down)
honda.changeGear(.up)
honda.changeGear(.up)
honda.changeGear(.up)
honda.changeGear(.down)
honda.changeGear(.up)
honda.changeGear(.up)
honda.changeGear(.up)
honda.changeGear(.up)
honda.changeGear(.up)
honda.changeGear(.up)
