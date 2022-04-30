//
//  UnitDuration.swift
//  weconverter
//
//  Created by Álvaro LDG on 29/04/22.
//

import Foundation

extension UnitDuration {
  class var days: UnitDuration {
    let converter = UnitConverterLinear(coefficient: 86400)
    return UnitDuration(symbol: "d", converter: converter)
  }
}
