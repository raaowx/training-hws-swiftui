//
//  ContentView.swift
//  viewsandmodifiers
//
//  Created by Álvaro LDG on 13/07/22.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct ContentView: View {
    var myTitle: some View {
        Group {
            Text("Title")
            Text("Subtitle")
        }
    }

    var body: some View {
        VStack {
            myTitle
                .titleStyle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
