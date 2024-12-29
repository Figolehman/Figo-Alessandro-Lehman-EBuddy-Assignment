//
//  View.swift
//  Figo Alessandro Lehman-EBuddy Assignment
//
//  Created by Figo Alessandro Lehman on 28/12/24.
//

import SwiftUI

extension View {
  func scaledFrame(width: CGFloat? = nil, height: CGFloat? = nil, alignment: Alignment = .center) -> some View {
    self
      .frame(
        width: width != nil ? getScaledWidth(width!) : nil,
        height: height != nil ? getScaledHeight(height!) : nil,
        alignment: alignment
      )
  }
}
