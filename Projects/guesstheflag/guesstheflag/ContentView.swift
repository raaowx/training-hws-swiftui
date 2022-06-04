//
//  ContentView.swift
//  guesstheflag
//
//  Created by Álvaro LDG on 04/06/22.
//

import SwiftUI

struct ContentView: View {
  @State private var showingAlert = false

  var body: some View {
    ZStack {
      RadialGradient(
        colors: [.black, .cyan],
        center: .center,
        startRadius: 20,
        endRadius: 500)
      VStack(spacing: 20) {
        ForEach(0..<3) { i in
          HStack(spacing: 20) {
            ForEach(0..<3) { j in
              ZStack {
                AngularGradient(
                  colors: [.cyan, .mint, .cyan],
                  center: .center)
                .frame(width: 90, height: 90)
                Button {
                  showingAlert.toggle()
                } label: {
                  HStack {
                    Text("\(i)")
                    Image(systemName: "x.circle.fill")
                    Text("\(j)")
                  }
                  .frame(width: 65, height: 45)
                  .foregroundColor(.black)
                  .background(LinearGradient(
                    gradient: Gradient(
                      stops: [
                        .init(color: .orange, location: 0.11),
                        .init(color: .yellow, location: 0.44),
                        .init(color: .orange, location: 0.88)
                      ]),
                    startPoint: .top,
                    endPoint: .bottom))
                }
                .alert("My Alert", isPresented: $showingAlert) {
                  Button("Ok!") { }
                  Button("Cancel", role: .cancel) { }
                  Button("Destroy!", role: .destructive) { }
                } message: {
                  Text("Did you read me?")
                }

              }
            }
          }
        }
      }
    }
    .ignoresSafeArea()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
