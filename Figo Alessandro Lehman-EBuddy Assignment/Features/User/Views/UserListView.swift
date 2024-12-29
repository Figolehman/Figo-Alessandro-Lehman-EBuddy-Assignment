//
//  UserListView.swift
//  Figo Alessandro Lehman-EBuddy Assignment
//
//  Created by Figo Alessandro Lehman on 27/12/24.
//

import PhotosUI
import SwiftUI

struct UserListView: View {
  @ObservedObject private var userManager = UserManager.shared

  @State private var isShowingPhotosPicker = false
  @State private var selectedItem: PhotosPickerItem? = nil
  @State private var selectedUser: User? = nil
  
  var body: some View {
    VStack {
      Button {
        userManager.getUsers()
      } label: {
        Text("Get Users")
      }

      Button {
        userManager.getSpecificUsers()
      } label: {
        Text("Get Specific Users with Multiple Queries")
      }

      if let users = try? userManager.users?.get() {
        if users.count > 0 {
          Text("Swipe Right on List Item to Upload Image")
          List(users, id: \.uid) { user in
            HStack {
              VStack(alignment: .leading) {
                // MARK: - phone number and email will always be null since the firebase USERS document only has ge and uid fields
                Text("gender: \(user.gender?.label ?? "null")")
                Text("phone number: \(user.phoneNumber ?? "null")")
                Text("email: \(user.email ?? "null")")
                Text("uid: \(user.uid ?? "null")")
              }

              Spacer()

              Image(uiImage: getUserProfileImage(uid: user.uid ?? ""))
                .renderingMode(.template)
                .resizable()
                .frame(width: 40, height: 40)
            }
            .swipeActions(edge: .leading, allowsFullSwipe: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/) {
              Button("Upload Image") {
                selectedUser = user
                isShowingPhotosPicker = true
              }
              .tint(.blue)
            }
            .onAppear {
              if let uid = user.uid {
                userManager.getUserProfileImage(uid: uid)
              }
            }
          }
        } else {
          Text("List is empty")
        }
      } else if case let .failure(error) = userManager.users {
        Text(error.localizedDescription)
      }
    }
    .photosPicker(
      isPresented: $isShowingPhotosPicker,
      selection: $selectedItem,
      matching: .images
    )
    .onChange(of: selectedItem) {
      guard
        let selectedItem,
        let selectedUser
      else { return }
      selectedItem.loadTransferable(type: Data.self) { result in
        switch result {
        case .success(let data):
          guard let data else { return }
          userManager.uploadImage(
            uid: selectedUser.uid ?? "",
            data: data
          )
        case .failure(let error):
          print(error.localizedDescription)
        }
      }
    }
  }

  fileprivate func getUserProfileImage(uid: String) -> UIImage {
    return UIImage(data: userManager.profileImageList[uid] ?? Data()) ?? UIImage(systemName: "person.crop.circle")!
  }
}

#Preview {
  NavigationView {
    UserListView()
  }
}
