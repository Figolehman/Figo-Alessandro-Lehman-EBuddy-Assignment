//
//  UserListView.swift
//  Figo Alessandro Lehman-EBuddy Assignment
//
//  Created by Figo Alessandro Lehman on 27/12/24.
//

import SwiftUI

struct UserListView: View {
  @StateObject private var userVM = UserViewModel()

  var body: some View {
    VStack {
      Button {
        userVM.getUsers()
      } label: {
        Text("Get Users")
      }

      if let users = try? userVM.users?.get() {
        if users.count > 0 {
          List(users, id: \.uid) { user in
            VStack(alignment: .leading) {
              // MARK: - phone number and email will always be null since the firebase USERS document only has ge and uid fields
              Text("gender: \(user.gender?.label ?? "null")")
              Text("phone number: \(user.phoneNumber ?? "null")")
              Text("email: \(user.email ?? "null")")
              Text("uid: \(user.uid ?? "null")")
            }
          }
        } else {
          Text("List is empty")
        }
      } else if case let .failure(error) = userVM.users {
        Text(error.localizedDescription)
      }
    }
  }
}

#Preview {
  UserListView()
}
