//
//  LoginViewModel.swift
//  Threads_Clone
//
//  Created by Pedro Marques on 26/04/24.
//

import Foundation

class LoginViewModel: ObservableObject {
   @Published var email = ""
   @Published var password = ""
   
   @MainActor
   func login() async throws {
      try await AuthService.shared.login(withEmail: email, password: password)
   }
}
