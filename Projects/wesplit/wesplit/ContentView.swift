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

  private let format = FloatingPointFormatStyle<Double>.Currency(code: Locale.current.currencyCode ?? "USD")

  private var total: Double {
    (checkAmount + Double(tipPercentage) * checkAmount / 100.0)
  }
  private var totalPerPerson: Double {
     total / Double((numberOfPeople + 2))
  }


  var body: some View {
    NavigationView {
      Form {
        Section {
          TextField("Amount", value: $checkAmount, format: format)
            .keyboardType(.decimalPad)
            .focused($amountIsFocused)

          Picker("Number of people", selection: $numberOfPeople) {
            ForEach(2..<100) {
              Text("\($0) people")
            }
          }
        } header: {
          Text("Check information")
        }

        Section {
          Picker("Tip percentage", selection: $tipPercentage) {
            ForEach(0..<101) {
              Text($0, format: .percent)
            }
          }
        } header: {
          Text("How much tip do you want to leave?")
        }


        Section {
          Text(totalPerPerson, format: format)
        } header: {
            Text("Amount per person")
        }

        Section {
          Text(total, format: format)
            .foregroundColor(tipPercentage == 0 ? .red : .primary)
        } header: {
          Text("Total amount")
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
