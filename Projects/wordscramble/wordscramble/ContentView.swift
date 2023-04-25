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

    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false

    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true) // <<<- Added by me
                }

                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).square") // <<<- Customized by me
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord.uppercased()) // <<<- Added by me
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showingError) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(errorMessage)
            }
        }
    }

    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)

        guard answer.count > 0 else { return }

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
        }
        newWord = ""
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
        rootWord = (allWords.randomElement() ?? "silkworm").trimmingCharacters(in: .whitespacesAndNewlines) // <<<- Added by me
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
