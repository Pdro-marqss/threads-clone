//
//  LoginView.swift
//  Threads_Clone
//
//  Created by Pedro Marques on 19/04/24.
//

import SwiftUI

struct LoginView: View {
   @StateObject var viewModel = LoginViewModel()
   
   var body: some View {
      NavigationStack {
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
            }
            
            NavigationLink {
               Text("Forgot password")
            } label: {
               Text("Forgot Password?")
                  .font(.footnote)
                  .fontWeight(.semibold)
                  .padding(.vertical)
                  .padding(.trailing, 28)
                  .foregroundColor(.black)
                  .frame(maxWidth: .infinity, alignment: .trailing)
            }
            
            Button {
               Task { try await viewModel.login()}
            } label : {
               Text("Login")
                  .modifier(ThreadsButtonModifier())
            }
            
            Spacer()
            
            Divider()
            
            NavigationLink {
               RegistrationView()
                  .navigationBarBackButtonHidden(true)
            } label: {
               HStack(spacing: 3) {
                  Text("Don't have an account?")
                  
                  Text("Sign Up")
                     .fontWeight(.semibold)
               }
               .font(.footnote)
               .foregroundStyle(.black)
            }
            .padding(.vertical, 16)
         }
      }
   }
}

#Preview {
   LoginView()
}
