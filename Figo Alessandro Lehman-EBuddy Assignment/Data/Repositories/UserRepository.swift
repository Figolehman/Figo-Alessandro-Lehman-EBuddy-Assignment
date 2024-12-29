//
//  UserRepository.swift
//  Figo Alessandro Lehman-EBuddy Assignment
//
//  Created by Figo Alessandro Lehman on 27/12/24.
//

import FirebaseFirestore
import FirebaseStorage

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

  // MARK: - If error does not exist, boolean result will always be true
  func uploadImage(uid: String, data: Data) async -> Result<Bool, Error> {
    let fileRef = Storage.storage().reference().child("images/\(uid).jpg")
    do {
      let _ = try await fileRef.putDataAsync(data)
      return .success(true)
    } catch {
      print(error.localizedDescription)
      return .failure(error)
    }
  }

  func getUserProfileImage(uid: String) async -> Result<Data, Error> {
    let fileRef = Storage.storage().reference().child("images/\(uid).jpg")
    do {
      // MARK: - x * 1024 * 1024 = x MB
      let data = try await fileRef.data(maxSize: 1 * 1024 * 1024)
      return .success(data)
    } catch {
      print(error.localizedDescription)
      return .failure(error)
    }
  }

  func getSpecificUsers() async -> Result<[User], Error> {
    do {
      let document = try await FirestoreDB.instance.collection("USERS")
        .order(by: "last_active", descending: true)
        .order(by: "rating", descending: true)
        .whereField("ge", isEqualTo: 0)
        .order(by: "price", descending: false)
        .getDocuments()

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
