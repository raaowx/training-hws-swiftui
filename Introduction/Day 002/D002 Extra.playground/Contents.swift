import UIKit

struct ColoredString: ExpressibleByStringInterpolation {
  struct StringInterpolation: StringInterpolationProtocol {
    var output = NSMutableAttributedString()

    var baseAttributes: [NSAttributedString.Key: Any] = [
      .font: UIFont(name: "Georgia-Italic", size: 64) ?? .systemFont(ofSize: 64),
      .foregroundColor: UIColor.black
    ]

    init(literalCapacity: Int, interpolationCount: Int) { }

    mutating func appendLiteral(_ literal: StringLiteralType) {
      print("Appending \(literal).")

      let attributedString = NSAttributedString(
        string: literal,
        attributes: baseAttributes)
      output.append(attributedString)
    }

    mutating func appendInterpolation(message: String, color: UIColor) {
      print("Appending \(message)")

      var coloredAttributes = baseAttributes
      coloredAttributes[.foregroundColor] = color

      let attributedString = NSAttributedString(
        string: message,
        attributes: coloredAttributes)
      output.append(attributedString)
    }
  }

  let value: NSAttributedString

  init(stringLiteral value: String) {
    self.value = NSAttributedString(string: value)
  }

  init(stringInterpolation: StringInterpolation) {
    self.value = stringInterpolation.output
  }
}

let str: ColoredString = "\(message: "Red", color: .red) \(message: "White", color: .white) \(message: "Blue", color: .blue)"

var interpolation = ColoredString.StringInterpolation(literalCapacity: 10, interpolationCount: 1)
interpolation.appendLiteral("Hello")
interpolation.appendInterpolation(message: "Hello", color: .red)
interpolation.appendLiteral("Hello")

let newStr = ColoredString(stringInterpolation: interpolation)
