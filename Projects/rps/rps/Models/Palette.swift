//
//  Palette.swift
//  rps
//
//  Created by Álvaro LDG on 06/02/2023.
//

import UIKit
import SwiftUI

enum Palette {
    case black
    case gray1
    case gray2
    case yellow1
    case yellow2

    var color: Color {
        switch self {
            case .black:
                guard let uiColor = UIColor(hex: "#202020") else { return .black }
                return Color(uiColor: uiColor)
            case .gray1:
                guard let uiColor = UIColor(hex: "#333533") else { return .gray }
                return Color(uiColor: uiColor)
            case .gray2:
                guard let uiColor = UIColor(hex: "#D6D6D6") else { return .gray }
                return Color(uiColor: uiColor)
            case .yellow1:
                guard let uiColor = UIColor(hex: "#FFD100") else { return .yellow }
                return Color(uiColor: uiColor)
            case .yellow2:
                guard let uiColor = UIColor(hex: "#FFEE32") else { return .yellow }
                return Color(uiColor: uiColor)
        }
    }
}
