//
//  Conversions.swift
//  weconverter
//
//  Created by Álvaro LDG on 29/04/22.
//

import Foundation

enum Conversions: CaseIterable {
  case temperature
  case length
  case time
  case volumen

  var title: String {
    switch self {
      case .temperature:
        return "conversion.temperature".localized
      case .length:
        return "conversion.length".localized
      case .time:
        return "conversion.time".localized
      case .volumen:
        return "conversion.volumen".localized
    }
  }
}
