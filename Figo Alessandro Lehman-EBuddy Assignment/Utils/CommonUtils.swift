//
//  CommonUtils.swift
//  Figo Alessandro Lehman-EBuddy Assignment
//
//  Created by Figo Alessandro Lehman on 28/12/24.
//

import SwiftUI

func getScaledWidth(_ width: CGFloat) -> CGFloat {
  // MARK: - 166 comes from the screen width of figma
  let designWidth: CGFloat = 166
  return width * UIScreen.screenWidth / designWidth
}

func getScaledHeight(_ height: CGFloat) -> CGFloat {
  // MARK: - design height does not come from the screen height of figma because it will not have a proper ratio
  let designHeight: CGFloat = 166 * UIScreen.screenHeight / UIScreen.screenWidth
  return height * UIScreen.screenHeight / designHeight
}
