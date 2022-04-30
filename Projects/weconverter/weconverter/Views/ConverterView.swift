//
//  ConverterView.swift
//  weconverter
//
//  Created by Álvaro LDG on 29/04/22.
//

import SwiftUI

struct ConverterView<C: Converter>: View {
  @State private var fromUnit = C.main
  @State private var fromValue = 0.0
  @State private var toUnit = C.main
  @FocusState private var fromValueFocused: Bool

  private let converter: C
  private let width = 100.0

  private var formatter: FloatingPointFormatStyle<Double> {
    .number.precision(.fractionLength(2))
  }
  private var toValue: String {
    "\(converter.convert(fromValue, from: fromUnit, to: toUnit).formatted(formatter)) \(toUnit.symbol)"
  }

  init(converter: C) {
    self.converter = converter
  }

  var body: some View {
    VStack {
      HStack {
        Text("converter.from".localized)
          .font(.headline)
          .frame(width: width)
        Picker("Unit", selection: $fromUnit) {
          ForEach(converter.availableUnits, id: \.self) { u in
            Text(u.symbol)
          }
        }
        .pickerStyle(.segmented)
      }

      HStack {
        Text("converter.to".localized)
          .font(.headline)
          .frame(width: width)
        Picker("Unit", selection: $toUnit) {
          ForEach(converter.availableUnits, id: \.self) { u in
            Text(u.symbol)
          }
        }
        .pickerStyle(.segmented)
      }

      HStack {
        Text("converter.input".localized)
          .font(.headline)
          .frame(width: width)
        TextField("converter.input.placeholder".localized, value: $fromValue, format: formatter)
          .keyboardType(.decimalPad)
          .focused($fromValueFocused)
        Button("converter.done".localized) {
          fromValueFocused.toggle()
        }
        .opacity(fromValueFocused ? 1 : 0)
      }
      HStack {
        Text("converter.result")
          .font(.headline)
          .frame(width: width)
        Spacer()
        Text(toValue)
          .bold()
        Spacer()
      }
    }
  }
}

struct ConverterView_Previews: PreviewProvider {
  static var previews: some View {
    ConverterView(converter: Temperature())
  }
}
