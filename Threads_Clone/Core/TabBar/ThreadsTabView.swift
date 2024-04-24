//
//  ThreadsTabView.swift
//  Threads_Clone
//
//  Created by Pedro Marques on 19/04/24.
//

import SwiftUI

struct ThreadsTabView: View {
   @State private var selectedTab = 0
   @State private var showCreateThreadView = false
   @State private var actualTab = 0
   
   var body: some View {
      TabView(selection: $selectedTab) {
         FeedView()
            .tabItem {
               Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                  .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
            }
            .onAppear{
               selectedTab = 0
               actualTab = 0
            }
            .tag(0)
         
         ExploreView()
            .tabItem {
               Image(systemName: "magnifyingglass")
            }
            .onAppear{
               selectedTab = 1
               actualTab = 1
            }
            .tag(1)
         
         Text("")
            .tabItem {
               Image(systemName: "plus")
            }
            .onAppear{ selectedTab = 2 }
            .tag(2)
         
         ActivityView()
            .tabItem {
               Image(systemName: selectedTab == 3 ? "heart.fill" : "heart")
                  .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
            }
            .onAppear{
               selectedTab = 3
               actualTab = 3
            }
            .tag(3)
         
         ProfileView()
            .tabItem {
               Image(systemName: selectedTab == 4 ? "person.fill" : "person")
                  .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
            }
            .onAppear{
               selectedTab = 4
               actualTab = 4
            }
            .tag(4)
      }
      .onChange(of: selectedTab, {
         showCreateThreadView = selectedTab == 2
      })
      .sheet(isPresented: $showCreateThreadView, onDismiss: {
         selectedTab = actualTab
      }, content: {
         CreateThreadView()
      })
      .tint(.black)
   }
}

#Preview {
   ThreadsTabView()
}
