//
//  Time.swift
//  weconverter
//
//  Created by Álvaro LDG on 29/04/22.
//

import Foundation

struct Time: Converter {
  typealias ConverterDimension = UnitDuration
  static var main: UnitDuration = .seconds
  var availableUnits: [UnitDuration] = [.seconds, .minutes, .hours, .days]
}
