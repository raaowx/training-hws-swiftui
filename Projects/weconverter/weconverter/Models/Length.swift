//
//  Length.swift
//  weconverter
//
//  Created by Álvaro LDG on 29/04/22.
//

import Foundation

struct Length: Converter {
  typealias ConverterDimension = UnitLength
  static var main: UnitLength = .meters
  var availableUnits: [UnitLength] = [.meters, .kilometers, .feet, .yards, .miles]
}
