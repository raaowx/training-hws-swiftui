//
//  ContentView.swift
//  rps
//
//  Created by Álvaro LDG on 04/02/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var round = 1
    @State private var score = 0
    @State private var currentOption = GameOptions.allCases.randomElement()!
    @State private var userShouldWin = Bool.random()
    @State private var gameHasEnded = false

    private var roundColor: Color {
        round > 7 ? .red : Palette.gray1.color
    }

    private var scoreColor: Color {
        score.isPositive ? .green : score.isNegative ? .red : Palette.gray1.color
    }

    var body: some View {
        let roundBinding = Binding<Int>(
            get: {
                round
            },
            set: {
                if $0 < 11 {
                    round = $0
                }
                gameHasEnded = $0 == 11
            }
        )

        let userDidTap = { (option: GameOptions) in
            // Score management
            if userShouldWin {
                score += currentOption.losesAgainst == option ? 1 : -1
            } else {
                score += currentOption.winAgainst == option ? 1 : -1
            }
            // Round management
            roundBinding.wrappedValue += 1
            // New round
            guard !gameHasEnded else { return }
            userShouldWin = round == 5 ? Bool.random() : !userShouldWin
            currentOption = GameOptions.allCases.randomElement()!
        }

        let resetGame = {
            roundBinding.wrappedValue = 1
            score = 0
            userShouldWin = Bool.random()
            currentOption = GameOptions.allCases.randomElement()!
        }

        return VStack {
            HStack(spacing: 4) {
                Spacer()
                HStack {
                    Text("Round:")
                    Text("\(roundBinding.wrappedValue)")
                        .foregroundColor(roundColor)
                }
                Spacer()
                Palette.gray1.color.frame(width: 1, height: 24)
                Spacer()
                HStack {
                    Text("Score:")
                    Text("\(score)")
                        .foregroundColor(scoreColor)
                }
                Spacer()

                if roundBinding.wrappedValue > 1 && !gameHasEnded {
                    Button {
                        resetGame()
                    } label: {
                        Image(systemName: "arrow.clockwise.circle")
                            .font(.title2)
                    }
                    Spacer()
                }
            }
            .font(.title)
            .foregroundColor(Palette.gray1.color)
            .background(Palette.yellow1.color)
            .frame(maxWidth: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(8)

            Spacer()

            Text(currentOption.emoji)
                .font(.system(size: 96))
                .shadow(radius: 4)
                .shadow(radius: 16)
                .shadow(color: Palette.yellow1.color, radius: 8, y: 4)

            Spacer()

            VStack(spacing: 24) {
                HStack {
                    Text("Which option")
                    Text(userShouldWin ? "WINS" : "LOSES")
                        .bold()
                        .underline()
                    Text("?")
                }
                .font(.title2)
                .foregroundColor(Palette.gray2.color)

                HStack(spacing: 24) {
                    ForEach([GameOptions.rock, GameOptions.scissors], id: \.rawValue) {
                        GameOptionView(option: $0, action: userDidTap)
                            .disabled(gameHasEnded)
                    }
                    .padding(4)
                }

                GameOptionView(option: .paper, action: userDidTap)
                    .disabled(gameHasEnded)
            }

            Spacer()

            if gameHasEnded {
                Button {
                    resetGame()
                } label: {
                    VStack(spacing: 4) {
                        Text("Game has finished!")
                            .underline()
                            .bold()
                        Text("Restart")
                    }
                }
                .font(.title3)
                .foregroundColor(Palette.gray2.color)
            }
        }
        .background(Palette.black.color)
        .statusBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
