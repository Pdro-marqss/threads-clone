//
//  CircularProfileImageView.swift
//  Threads_Clone
//
//  Created by Pedro Marques on 21/04/24.
//

import SwiftUI

struct CircularProfileImageView: View {
    var body: some View {
        Image("moniqs")
            .resizable()
            .scaledToFill()
            .clipShape(Circle())
            .frame(width: 50, height: 50)
    }
}

#Preview {
    CircularProfileImageView()
}
