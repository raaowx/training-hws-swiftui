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
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct ProminentTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.weight(.black))
            .foregroundColor(.blue)
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }

    func prominentTitleStyle() -> some View {
        modifier(ProminentTitle())
    }
}

struct ContentView: View {
    var myTitle: some View {
        Group {
            Text("Hacking with Swift")
            Text("100 days of SwiftUI")
        }
    }

    var body: some View {
        VStack {
            Text("My prominent title")
                .prominentTitleStyle()
            Spacer()
            myTitle
                .titleStyle()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
