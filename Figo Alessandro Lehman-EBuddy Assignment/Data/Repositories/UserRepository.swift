//
//  UserRepository.swift
//  Figo Alessandro Lehman-EBuddy Assignment
//
//  Created by Figo Alessandro Lehman on 27/12/24.
//

import FirebaseFirestore

class UserRepository {
  func getUsers() async -> Result<[User], Error> {
    do {
      let document = try await FirestoreDB.instance.collection("USERS").getDocuments()
      if !document.isEmpty {
        let data = try document.documents.compactMap {
          try $0.data(as: UserJSON.self)
        }

        return .success(data)
      } else {
        print("Document does not exist")
        return .success([])
      }
    } catch {
      print(error.localizedDescription)
      return .failure(error)
    }
  }
}
