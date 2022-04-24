import Cocoa

// --- FUNCTION COMPOSITION ---

// TASK: Given a players array, add 50 points to those top players creating a new list and print out the results.
// Top player: Those who has its total score between 150 and 200.

struct Player {
  let name: String
  var score: Int
}

var players = [Player]()

for name in ["Carl", "Johanna", "Lizzie", "Tom", "Alex", "Robert", "Eva", "Michael", "Angelica", "Tim"] {
  let randomScore = { (min: Int, max: Int) -> Int in
    Int.random(in: min...max)
  }
  let player = Player(
    name: name,
    score: Bool.random() ? randomScore(150, 200) : randomScore(1, 149)
  )
  players.append(player)
}

func getTopPlayers(_ players: [Player]) -> [Player] {
  players.filter { $0.score >= 150 && $0.score <= 200 }
}

func addReward(_ players: [Player]) -> [Player] {
  var rewardedPlayers = [Player]()
  players.map {
    rewardedPlayers.append(
      Player(
        name: $0.name,
        score: $0.score + 50
      )
    )
  }
  return rewardedPlayers
}

func printOut(_ players: [Player]) {
  players.forEach {
    print("Player \($0.name) now has \($0.score) points.")
  }
  print("\n\n")
}

players.forEach {
  print("Player \($0.name) has an initial score of \($0.score) points")
}
print()

// SOLUTION - Without function composition
let topPlayers1 = addReward(getTopPlayers(players))
printOut(topPlayers1)

// SOLUTION - With function composition
precedencegroup Group { associativity: left }
infix operator >>>: Group

func >>> <T, U, V>(_ left: @escaping (T) -> U, _ right: @escaping (U) -> V) -> (T) -> V {
  return { right(left($0)) }
}

let topPlayers2 = (getTopPlayers >>> addReward)(players)
printOut(topPlayers2)

// SOLUTION - One step further
let rewardTopPlayers = getTopPlayers >>> addReward
let topPlayers3 = rewardTopPlayers(players)
printOut(topPlayers3)
