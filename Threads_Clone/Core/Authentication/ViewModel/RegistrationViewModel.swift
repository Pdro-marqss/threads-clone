//
//  RegistrationViewModel.swift
//  Threads_Clone
//
//  Created by Pedro Marques on 25/04/24.
//

import Foundation

class RegistrationViewModel: ObservableObject {
   @Published var email = ""
   @Published var password = ""
   @Published var fullName = ""
   @Published var userName = ""
   
   @MainActor
   func createUser() async throws {
      try await AuthService.shared.createUser(
         withEmail: email,
         password: password,
         fullname: fullName,
         username: userName
      )
   }
}
