//
//  RegistrationView.swift
//  Threads_Clone
//
//  Created by Pedro Marques on 19/04/24.
//

import SwiftUI

struct RegistrationView: View {
   @StateObject var viewModel = RegistrationViewModel()
   @Environment(\.dismiss) var dismiss
   
   var body: some View {
      VStack {
         Spacer()
         
         Image("threads-logo")
            .resizable()
            .scaledToFit()
            .frame(width: 120, height: 120)
            .padding()
         
         VStack {
            TextField("Enter your email", text: $viewModel.email)
               .textInputAutocapitalization(.never)
               .modifier(ThreadsTextFieldModifier())
            
            SecureField("Enter your password", text: $viewModel.password)
               .modifier(ThreadsTextFieldModifier())
            
            TextField("Enter your full name", text: $viewModel.fullName)
               .modifier(ThreadsTextFieldModifier())
            
            TextField("Enter your username", text: $viewModel.userName)
               .modifier(ThreadsTextFieldModifier())
         }
         
         Button {
            Task { try await viewModel.createUser() }
         } label : {
            Text("Sign Up")
               .modifier(ThreadsButtonModifier())
         }
         .padding(.vertical)
         
         Spacer()
         
         Divider()
         
         Button {
            dismiss()
         } label: {
            HStack(spacing: 3) {
               Text("Already have an account?")
               
               Text("Sign In")
            }
            .font(.footnote)
            .foregroundStyle(.black)
            .padding(.vertical, 16)
         }
      }
   }
}

#Preview {
   RegistrationView()
}
