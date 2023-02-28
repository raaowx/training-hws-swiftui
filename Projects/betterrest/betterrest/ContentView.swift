//
//  ContentView.swift
//  betterrest
//
//  Created by Álvaro LDG on 20/2/23.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Self.defaultWakeUp
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var alertIsShowing = false

    private static var defaultWakeUp: Date {
        var components = DateComponents()
        components.hour = 6
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }

    var body: some View {
        NavigationView {
            Form {
                VStack(alignment: .leading, spacing: 8) {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)

                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Daily coffee intake")
                        .font(.headline)
                    Stepper("\(coffeeAmount) \(coffeeAmount == 1 ? "cup" : "cups")", value: $coffeeAmount, in: 1...20)
                }

            }
            .navigationTitle("BetterRest")
            .toolbar {
                Button("Calculate", action: calculateBedtime)
            }
            .alert(alertTitle, isPresented: $alertIsShowing) {
                Button("OK") { }
            } message: {
                Text(alertMessage)
            }
        }
    }

    func calculateBedtime() {
        do {
            let configuration = MLModelConfiguration()
            let model = try BetterRest(configuration: configuration)

            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hoursInSecs = (components.hour ?? 0) * 60 * 60
            let minutesInSecs = (components.minute ?? 0) * 60

            let prediction = try model.prediction(
                wake: Double(hoursInSecs + minutesInSecs),
                estimatedSleep: sleepAmount,
                coffee: Double(coffeeAmount)
            )

            let sleepTime = wakeUp - prediction.actualSleep

            alertTitle = "Your ideal betime is..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }

        alertIsShowing = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
