//
//  WeConverterView.swift
//  weconverter
//
//  Created by Álvaro LDG on 29/04/22.
//

import SwiftUI

struct WeConverterView: View {
  @State private var selectedConversion: Conversions = .temperature

  var body: some View {
    NavigationView {
      Form {
        Section {
          Picker("", selection: $selectedConversion) {
            ForEach(Conversions.allCases, id: \.self) {
              Text($0.title)
            }
          }
          .pickerStyle(.segmented)
        } header: {
          Text("weconverter.section.1".localized)
        }

        Section {
          getConverterView()
        } header: {
          Text(selectedConversion.title)
        }
      }
      .navigationTitle("weconverter.title".localized)
    }
  }
}

extension WeConverterView {
  private func getConverterView() -> some View {
    switch selectedConversion {
      case .temperature:
        return AnyView(ConverterView(converter: Temperature()))
      case .length:
        return AnyView(ConverterView(converter: Length()))
      case .time:
        return AnyView(ConverterView(converter: Time()))
      case .volumen:
        return AnyView(ConverterView(converter: Volumen()))
    }
  }
}

struct WeConverterView_Previews: PreviewProvider {
  static var previews: some View {
    WeConverterView()
  }
}
