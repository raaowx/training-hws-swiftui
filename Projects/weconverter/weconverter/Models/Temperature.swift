//
//  Temperature.swift
//  weconverter
//
//  Created by Álvaro LDG on 29/04/22.
//

import Foundation

struct Temperature: Converter {
  typealias ConverterDimension = UnitTemperature
  static var main: UnitTemperature = .kelvin
  var availableUnits: [UnitTemperature] = [.celsius, .fahrenheit, .kelvin]
}
