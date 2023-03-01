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
    @State private var sleepAmount = 7.0
    @State private var coffeeAmount = 3

    private var sleepAmountAsTime: String {
        var components = DateComponents()
        components.hour = Int(sleepAmount)
        components.minute = {
            switch "\(sleepAmount)".split(separator: ".").last {
                case "25": return 15
                case "5": return 30
                case "75": return 45
                default: return 0
            }
        }()

        guard let date = Calendar.current.date(from: components) else { return "\(sleepAmount)" }
        return date.formatted(.dateTime.hour(.defaultDigits(amPM: .omitted)).minute())
    }

    private var bedtimeEstimationDate: Date? {
        calculateBedtime()
    }

    private var bedtimeEstimationTitle: String {
        bedtimeEstimationDate != nil ? "Your ideal betime is..." : "Error"
    }

    private var bedtimeEstimationMessage: String {
        guard let sleepTime = bedtimeEstimationDate else {
            return "Sorry, there was a problem calculating your bedtime."
        }
        return sleepTime.formatted(date: .omitted, time: .shortened)
    }

    private static var defaultWakeUp: Date {
        var components = DateComponents()
        components.hour = 6
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }

    var body: some View {
        GeometryReader { gr in
            NavigationView {
                VStack {
                    Color.black
                        .frame(width: gr.size.width - 96, height: 1)
                        .opacity(0.2)

                    Text("Welcome! We'll try to estimate your bedtime hour based in you desired wake up time and your daily coffee intake.")
                        .font(.subheadline)
                        .padding(16)
                        .multilineTextAlignment(.center)

                    Form {
                        Section("Step 1: Sleep Data") {
                            HStack {
                                Text("When do you want to wake up?")
                                Spacer()
                                DatePicker("When do you want to wake up?", selection: $wakeUp, displayedComponents: .hourAndMinute)
                                    .labelsHidden()
                            }
                            HStack {
                                Text("How many hours do you want to sleep?")
                                    .font(.callout)
                                Spacer()
                                VStack {
                                    Stepper(sleepAmountAsTime, value: $sleepAmount, in: 4...12, step: 0.25)
                                        .labelsHidden()
                                    Text("\(sleepAmountAsTime) hours")
                                }
                            }
                        }

                        Section("Step 2: Coffee Intake") {
                            Picker("How many coffees do you drink in a day?", selection: $coffeeAmount) {
                                ForEach(1...20, id: \.self) {
                                    Text("\($0) \($0 == 1 ? "cup" : "cups")")
                                }
                            }
                        }
                    }

                    VStack(spacing: 8) {
                        Text(bedtimeEstimationTitle)
                            .font(.title)
                        Text(bedtimeEstimationMessage)
                            .font(.largeTitle)
                    }
                    .padding(16)

                }
                .navigationTitle("BetterRest")
            }
        }
    }

    func calculateBedtime() -> Date? {
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

            return wakeUp - prediction.actualSleep
        } catch {
            return nil
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
