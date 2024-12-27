//
//  User.swift
//  Figo Alessandro Lehman-EBuddy Assignment
//
//  Created by Figo Alessandro Lehman on 28/12/24.
//

enum GenderEnum: Int, Codable {
  case female = 0
  case male = 1

  var label: String {
    switch self {
    case .female:
      "Female"
    case .male:
      "Male"
    }
  }
}

protocol User {
  var uid: String? { get }
  var email: String? { get }
  var phoneNumber: String? { get }
  var gender: GenderEnum? { get set }
}
