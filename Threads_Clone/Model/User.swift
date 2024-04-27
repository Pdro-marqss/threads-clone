//
//  User.swift
//  Threads_Clone
//
//  Created by Pedro Marques on 26/04/24.
//

import Foundation

struct User: Identifiable, Codable {
   let id: String
   let fullname: String
   let email: String
   let username: String
   var profileImageUrl: String?
   var bio: String?   
}
