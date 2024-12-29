//
//  Font.swift
//  Figo Alessandro Lehman-EBuddy Assignment
//
//  Created by Figo Alessandro Lehman on 28/12/24.
//

import SwiftUI

enum FontType: String {
  case interBold = "Inter-Bold"
  case helveticaRegular = "HelveticaNeue-Roman"
}

extension Font {
  static func custom(type: FontType, size: CGFloat) -> Font {
    return Font.custom(type.rawValue, size: size)
  }
}

