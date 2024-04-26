//
//  ContentView.swift
//  Threads_Clone
//
//  Created by Pedro Marques on 19/04/24.
//

import SwiftUI

struct ContentView: View {
   @StateObject var viewModel = ContentViewModel()
   
    var body: some View {
       Group {
          if viewModel.userSession != nil {
             ThreadsTabView()
          } else {
             LoginView()
          }
       }
    }
}

#Preview {
    ContentView()
}
