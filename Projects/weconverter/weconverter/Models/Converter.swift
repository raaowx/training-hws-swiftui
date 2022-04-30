//
//  Converter.swift
//  weconverter
//
//  Created by Álvaro LDG on 29/04/22.
//

import Foundation

protocol Converter {
  associatedtype ConverterDimension: Dimension
  static var main: ConverterDimension { get }
  var availableUnits: [ConverterDimension] { get }

  func convert(_ value: Double, from: Dimension, to: Dimension) -> Double
}

extension Converter {
  func convert(_ value: Double, from: Dimension, to: Dimension) -> Double {
    Measurement(value: value, unit: from).converted(to: to).value
  }
}
