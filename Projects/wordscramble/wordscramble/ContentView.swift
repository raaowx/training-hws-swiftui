//
//  ContentView.swift
//  wordscramble
//
//  Created by Álvaro LDG on 28/3/23.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var score = 0

    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false

    private let minLength = 3

    var body: some View {
        NavigationView {
            List {
                Section {
                    Text("""
                     Make as many words as possible with the letters in '**\(rootWord)**'.

                     Every word you made adds 10 points. Also, every word adds the same amount of points as letters contains.
                     """)
                    .multilineTextAlignment(.center)
                    HStack {
                        Text("Your current score is:")
                        Spacer()
                        Text("\(score)")
                            .foregroundColor(score > 0 ? .mint : .black)
                            .font(.headline)
                    }
                }
                .font(.subheadline)

                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                }

                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).square")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord.uppercased())
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showingError) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(errorMessage)
            }
            .toolbar {
                Button(action: startGame, label: {
                    Text("Restart")
                    Image(systemName: "restart")
                })
                .foregroundColor(.red)
            }
        }
    }

    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)

        guard isLongEnough(word: answer) else {
            wordError(title: "Word is not long enough", message: "Please, write at least \(minLength) characters!")
            return
        }

        guard isNotRootWord(word: answer) else {
            wordError(title: "Word can't be the same as the initial one", message: "Don't copy!")
            return
        }

        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original!")
            return
        }

        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'")
            return
        }

        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }

        withAnimation {
            usedWords.insert(answer, at: 0)
            score += 10
            score += newWord.count
        }

        newWord = ""
    }

    func isLongEnough(word: String) -> Bool {
        word.count >= minLength
    }

    func isNotRootWord(word: String) -> Bool {
        word != rootWord
    }

    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }

    func isPossible(word: String) -> Bool {
        var tempWord = rootWord

        for letter in word {
            guard let pos = tempWord.firstIndex(of: letter) else { return false }
            tempWord.remove(at: pos)
        }

        return true
    }

    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        return checker.rangeOfMisspelledWord(
            in: word,
            range: range,
            startingAt: 0,
            wrap: false,
            language: "en").location == NSNotFound
    }

    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }

    func startGame() {
        guard let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") else {
            fatalError("File not found in Bundle")
        }

        guard let startWords = try? String(contentsOf: startWordsURL) else {
            fatalError("File data can't be loaded")
        }

        let allWords = startWords.components(separatedBy: .newlines)
        rootWord = (allWords.randomElement() ?? "silkworm").trimmingCharacters(in: .whitespacesAndNewlines)
    }

    func resetGame() {
        usedWords.removeAll()
        rootWord = ""
        newWord = ""
        score = 0
        errorTitle = ""
        errorMessage = ""
        showingError = false

        startGame()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
