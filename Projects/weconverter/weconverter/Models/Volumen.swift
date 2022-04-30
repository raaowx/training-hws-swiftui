//
//  Volumen.swift
//  weconverter
//
//  Created by Álvaro LDG on 29/04/22.
//

import Foundation

struct Volumen: Converter {
  typealias ConverterDimension = UnitVolume
  static var main: UnitVolume = .liters
  var availableUnits: [UnitVolume] = [.milliliters, .liters, .cups, .pints, .gallons]
}
