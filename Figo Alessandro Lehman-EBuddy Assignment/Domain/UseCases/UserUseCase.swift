//
//  UserUseCase.swift
//  Figo Alessandro Lehman-EBuddy Assignment
//
//  Created by Figo Alessandro Lehman on 27/12/24.
//

import Foundation

class UserUseCase {
  private let repository = UserRepository()

  func getUsers() async -> Result<[User], Error> {
    await repository.getUsers()
  }

  func uploadImage(uid: String, data: Data) async -> Result<Bool, Error> {
    await repository.uploadImage(uid: uid, data: data)
  }

  func getUserProfileImage(uid: String) async -> Result<Data, Error> {
    await repository.getUserProfileImage(uid: uid)
  }
}
