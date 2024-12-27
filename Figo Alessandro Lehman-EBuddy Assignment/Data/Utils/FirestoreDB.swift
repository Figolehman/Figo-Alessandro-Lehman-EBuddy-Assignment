//
//  FirestoreDB.swift
//  Figo Alessandro Lehman-EBuddy Assignment
//
//  Created by Figo Alessandro Lehman on 27/12/24.
//

import FirebaseFirestore

class FirestoreDB {
  static let instance = Firestore.firestore()

  private init() {}
}
