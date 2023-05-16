//
//  ContentView.swift
//  animations
//
//  Created by Álvaro LDG on 10/5/23.
//

import SwiftUI

struct ContentView: View {
    @State private var enabled1 = false
    @State private var enabled2 = false
    @State private var dragAmount2 = CGSize.zero
    @State private var isShowingRed3 = false

    private let letters = Array("Hello SwiftUI")

    var body: some View {
        VStack {
            Button("Tap Me") {
                enabled1.toggle()
            }
            .frame(width: 200, height: 200)
            .background(enabled1 ? .blue : .red)
            .animation(nil, value: enabled1)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: enabled1 ? 60 : 0))
            .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled1)


            HStack(spacing: 0) {
                ForEach(0..<letters.count, id: \.self) { num in
                    Text(String(letters[num]))
                        .padding(5)
                        .font(.title)
                        .background(enabled2 ? .blue : .red)
                        .offset(dragAmount2)
                        .animation(.default.delay(Double(num) / Double(letters.count)), value: dragAmount2)
                }
            }
            .gesture(
                DragGesture()
                    .onChanged { dragAmount2 = $0.translation}
                    .onEnded { _ in
                        dragAmount2 = .zero
                        enabled2.toggle()
                    }
            )

            Button("Tap Me 2") {
                withAnimation {
                    isShowingRed3.toggle()
                }
            }

            if isShowingRed3 {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(
                        insertion: .move(edge: .leading),
                        removal: .opacity)
                    )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
