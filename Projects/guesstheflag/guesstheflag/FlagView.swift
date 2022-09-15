//
//  FlagView.swift
//  guesstheflag
//
//  Created by Álvaro LDG on 15/09/22.
//

import SwiftUI

struct FlagView: View {
    let imageName: String


    var body: some View {
        Image(imageName)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct FlagView_Previews: PreviewProvider {
    static var previews: some View {
        FlagView(imageName: "Spain")
    }
}
