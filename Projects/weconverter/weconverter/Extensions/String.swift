//
//  Strings.swift
//  weconverter
//
//  Created by Álvaro LDG on 29/04/22.
//

import Foundation

extension String {
  var localized: String {
    NSLocalizedString(self, comment: "")
  }
}
