//
//  Figo_Alessandro_Lehman_EBuddy_AssignmentApp.swift
//  Figo Alessandro Lehman-EBuddy Assignment
//
//  Created by Figo Alessandro Lehman on 27/12/24.
//

import SwiftUI

@main
struct Figo_Alessandro_Lehman_EBuddy_AssignmentApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  var body: some Scene {
    WindowGroup {
      UserDetailView()
    }
  }
}
