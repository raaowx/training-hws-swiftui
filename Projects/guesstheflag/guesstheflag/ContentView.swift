//
//  ContentView.swift
//  guesstheflag
//
//  Created by Álvaro LDG on 04/06/22.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)

    @State private var scoreTitle = ""
    @State private var scoreAmount = 0
    @State private var remainingQuestions = 8

    @State private var showingScore = false
    @State private var showingFinal = false

    @State private var rotationAngles = [0.0, 0.0, 0.0]
    @State private var scalePercentage = [1.0, 1.0, 1.0]
    @State private var blurred = [false, false, false]

    var body: some View {
        ZStack {
            RadialGradient(
                stops: [
                    .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                    .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
                ],
                center: .top,
                startRadius: 75,
                endRadius: 675)
            .ignoresSafeArea()

            RadialGradient(
                stops: [
                    .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                    .init(color: Color(red: 0, green: 0, blue: 0, opacity: 0), location: 0.3)
                ],
                center: .bottom,
                startRadius: 75,
                endRadius: 675)
            .ignoresSafeArea()

            VStack {
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)

                Spacer()

                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))

                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold).italic())
                    }

                    ForEach(0..<3) { number in
                        Button {
                            withAnimation {
                                rotationAngles[number] += 360
                                for i in 0..<scalePercentage.count {
                                    guard i != number else { continue }
                                    scalePercentage[i] = 0.75
                                    blurred[i] = true
                                }
                            }

                            Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false) { _ in flagTapped(number) }
                        } label: {
                            FlagView(imageName: countries[number])
                                .rotation3DEffect(.degrees(rotationAngles[number]), axis: (x: 0, y: 1, z: 0))
                                .scaleEffect(scalePercentage[number])
                                .blur(radius: blurred[number] ? 5 : 0)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))

                Spacer()

                Text("Score: \(scoreAmount)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                Text("Remaining questions: \(remainingQuestions)")
                    .foregroundColor(.white)
                    .font(.title3.weight(.semibold))
            }
            .padding(30)

        }
        .alert(scoreTitle, isPresented: $showingScore, actions: {
            Button("Continue", action: askQuestion)
        }, message: {
            Text("Your score is \(scoreAmount)")
        })
        .alert("Your final score is \(scoreAmount)", isPresented: $showingFinal, actions: {
            Button("Start over!", action: reset)
        })
    }

    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            scoreAmount += 1
        } else {
            // Add the name of the choosen country with some protection to avoid `indexOutOfBounds`.
            scoreTitle = "Wrong\(countries.count > number ? "! That's the flag of \(countries[number])" : "!")"
        }
        remainingQuestions -= 1
        showingScore = true
    }

    func askQuestion() {
        guard remainingQuestions > 0 else {
            showingFinal = true
            return
        }
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)

        withAnimation {
            rotationAngles = [0.0, 0.0, 0.0]
            scalePercentage = [1.0, 1.0, 1.0]
            blurred = [false, false, false]
        }
    }

    func reset() {
        scoreAmount = 0
        remainingQuestions = 8
        askQuestion()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
