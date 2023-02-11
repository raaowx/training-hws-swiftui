//
//  GameOptionView.swift
//  rps
//
//  Created by Álvaro LDG on 05/02/2023.
//

import SwiftUI

struct GameOptionView: View {
    @Environment(\.isEnabled) private var isEnabled: Bool

    private let option: GameOptions
    private let action: ((_ option: GameOptions) -> Void)?

    var body: some View {
        Button {
            action?(option)
        } label: {
            ZStack {
                Rectangle()
                    .foregroundColor(isEnabled ? Palette.yellow1.color : Palette.gray1.color)
                Text(option.emoji)
                    .font(.system(size: 96))
                    .shadow(radius: 4)
                    .shadow(radius: 32)
            }
            .frame(maxWidth: 120, maxHeight: 120)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .opacity(isEnabled ? 1.0 : 0.5)
    }

    init(option: GameOptions, action: ((_ option: GameOptions) -> Void)? = nil) {
        self.option = option
        self.action = action
    }
}

struct GameOptionView_Previews: PreviewProvider {
    static var previews: some View {
        GameOptionView(option: .rock)
    }
}
