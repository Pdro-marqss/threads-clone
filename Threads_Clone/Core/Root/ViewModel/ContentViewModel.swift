//
//  ContentViewModel.swift
//  Threads_Clone
//
//  Created by Pedro Marques on 26/04/24.
//

import Foundation
import Combine
import Firebase

class ContentViewModel: ObservableObject {
   @Published var userSession: FirebaseAuth.User?
   private var cancellables = Set<AnyCancellable>()
   
   init() {
      setupSubscribers()
   }
   
   private func setupSubscribers() {
      AuthService.shared.$userSession.sink { [weak self] userSession in
         self?.userSession = userSession
      }.store(in: &cancellables)
   }
}
