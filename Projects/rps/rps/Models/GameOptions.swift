//
//  GameOptions.swift
//  rps
//
//  Created by Álvaro LDG on 05/02/2023.
//

import Foundation

enum GameOptions: Int, CaseIterable {
    case rock
    case paper
    case scissors

    var emoji: String {
        switch self {
            case .rock: return "✊"
            case .paper: return "🖐️"
            case .scissors: return "✌️"
        }
    }

    var winAgainst: GameOptions {
        switch self {
            case .rock: return .scissors
            case .paper: return .rock
            case .scissors: return .paper
        }
    }

    var losesAgainst: GameOptions {
        switch self {
            case .rock: return .paper
            case .paper: return .scissors
            case .scissors: return .rock
        }
    }
}
