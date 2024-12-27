//
//  UserJSON.swift
//  Figo Alessandro Lehman-EBuddy Assignment
//
//  Created by Figo Alessandro Lehman on 27/12/24.
//

import Foundation

struct UserJSON: User, Codable {
  var uid: String?
  var email: String?
  var phoneNumber: String?
  var gender: GenderEnum?

  enum CodingKeys: String, CodingKey {
    case uid = "uid"
    case email
    case phoneNumber
    case gender = "ge"
  }
}
