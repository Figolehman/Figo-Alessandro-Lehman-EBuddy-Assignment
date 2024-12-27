//
//  UserViewModel.swift
//  Figo Alessandro Lehman-EBuddy Assignment
//
//  Created by Figo Alessandro Lehman on 28/12/24.
//

import Foundation

@MainActor
class UserViewModel: ObservableObject {
  @Published var users: Result<[User], Error>? = nil

  private var userUseCase = UserUseCase()

  func getUsers() {
    Task {
      users = await userUseCase.getUsers()
    }
  }
}
