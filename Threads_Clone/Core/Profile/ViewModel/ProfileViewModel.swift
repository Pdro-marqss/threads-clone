//
//  ProfileViewModel.swift
//  Threads_Clone
//
//  Created by Pedro Marques on 26/04/24.
//

import Foundation
import Combine

class ProfileViewModel: ObservableObject {
   @Published var currentUser: User?
   private var cancellables = Set<AnyCancellable>()
   
   init() {
      setupSubscribers()
   }
   
   private func setupSubscribers() {
      UserService.shared.$currentUser.sink { [weak self] user in
         self?.currentUser = user
         print("DEBUG: User in viewModel from Combine is \(user)")
      }.store(in: &cancellables)
   }
}
