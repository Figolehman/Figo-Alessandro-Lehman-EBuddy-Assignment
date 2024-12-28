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
  @Published var uploadImageStatus: Result<Bool, Error>? = nil
  @Published var userProfileImage: Result<Data, Error>? = nil

  @Published var profileImageList: [String: Data] = [:]

  private var userUseCase = UserUseCase()

  func getUsers() {
    Task {
      users = await userUseCase.getUsers()
    }
  }

  func uploadImage(uid: String, data: Data) {
    Task {
      uploadImageStatus = await userUseCase.uploadImage(uid: uid, data: data)
    }
    getUserProfileImage(uid: uid)
  }

  func getUserProfileImage(uid: String) {
    Task {
      let result = await userUseCase.getUserProfileImage(uid: uid)
      userProfileImage = result
      if let image = try? result.get() {
        profileImageList[uid] = image
      }
    }
  }
}
