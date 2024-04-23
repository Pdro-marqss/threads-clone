//
//  EditProfileView.swift
//  Threads_Clone
//
//  Created by Pedro Marques on 23/04/24.
//

import SwiftUI

struct EditProfileView: View {
   @State private var bio: String = ""
   @State private var link: String = ""
   @State private var isPrivateProfile: Bool = false
   
    var body: some View {
       NavigationStack {
          ZStack {
             Color(.systemGroupedBackground)
                .ignoresSafeArea()
             
             VStack {
                //name and profile image
                HStack {
                   VStack(alignment: .leading) {
                      Text("Name")
                         .fontWeight(.semibold)
                      
                      Text ("Monique Almeida")
                   }
                   
                   Spacer()
                   
                   CircularProfileImageView()
                }
                
                Divider()
                
                //bio fields
                VStack(alignment: .leading) {
                   Text("Bio")
                      .fontWeight(.semibold)
                   
                   TextField("Enter your bio...", text: $bio, axis: .vertical)
                }
                
                Divider()
                
                VStack(alignment: .leading) {
                   Text("Link")
                      .fontWeight(.semibold)
                   
                   TextField("Add link...", text: $link)
                }
                
                Divider()
                
                Toggle("Private Profile", isOn: $isPrivateProfile)
                
             }
             .font(.footnote)
             .padding()
             .background(.white)
             .clipShape(.rect(cornerRadius: 10))
             .overlay {
                RoundedRectangle(cornerRadius: 10)
                   .stroke(Color(.systemGray4), lineWidth: 1)
             }
             .padding()
          }
          .navigationTitle("Edit Profile")
          .navigationBarTitleDisplayMode(.inline)
          .toolbar {
             ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                   
                }
                .font(.subheadline)
                .foregroundStyle(.black)
             }
             
             ToolbarItem(placement: .topBarTrailing) {
                Button("Done") {
                   
                }
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.black)
             }
          }
       }
    }
}

#Preview {
    EditProfileView()
}
