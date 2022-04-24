//
//  ContentView.swift
//  wesplit
//
//  Created by Álvaro LDG on 24/04/22.
//

import SwiftUI

struct ContentView: View {
  @State private var checkAmount = 0.0
  @State private var numberOfPeople = 2
  @State private var tipPercentage = 20
  @FocusState private var amountIsFocused: Bool

  private let tipPercentages = [10, 15, 20, 25, 0]

  private var totalPerPerson: Double {
    (checkAmount + Double(tipPercentage) * checkAmount / 100.0) / Double((numberOfPeople + 2))
  }


  var body: some View {
    NavigationView {
      Form {
        Section {
          TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
            .keyboardType(.decimalPad)
            .focused($amountIsFocused)

          Picker("Number of people", selection: $numberOfPeople) {
            ForEach(2..<100) {
              Text("\($0) people")
            }
          }
        }

        Section {
          Picker("Tip percentage", selection: $tipPercentage) {
            ForEach(tipPercentages, id: \.self) {
              Text($0, format: .percent)
            }
          }
          .pickerStyle(.segmented)
        } header: {
          Text("How much tip do you want to leave?")
        }


        Section {
          Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
        }
      }
      .navigationTitle("We Split")
      .toolbar {
        ToolbarItemGroup(placement: .keyboard) {
          Spacer()
          Button("Done") {
            amountIsFocused = false
          }
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
