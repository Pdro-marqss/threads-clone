//
//  ProfileView.swift
//  Threads_Clone
//
//  Created by Pedro Marques on 19/04/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            //bio and stats
            VStack(spacing: 20) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 12) {
                        //fullname and username
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Monique Almeida")
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            Text("moniszx_")
                                .font(.subheadline)
                        }
                        
                        Text("Psicóloga, gostosa e mulher do @PedroMarques")
                            .lineLimit(2)
                            .frame(width: 200, alignment: .leading)
                            .padding(0)
                            .font(.footnote)
                        
                        Text("1.418 followers")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    
                    Spacer()
                    
                    CircularProfileImageView()
                }
                
                Button {
                    
                } label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 352, height: 32)
                        .background(.black)
                        .clipShape(.rect(cornerRadius: 8))
                }
                
                //user content list view
                VStack {
                    HStack {
                        ForEach(ProfileThreadFilter.allCases) {filter in
                            VStack {
                                Text(filter.title)
                                    .font(.subheadline)
                                    .fontWeight(selectedFilter == filter ? .semibold : .regular)
                                
                                if selectedFilter == filter {
                                    Rectangle()
                                        .foregroundStyle(.black)
                                        .frame(width: filterBarWidth, height: 1)
                                        .matchedGeometryEffect(id: "item", in: animation)
                                } else {
                                    Rectangle()
                                        .foregroundStyle(.clear)
                                        .frame(width: filterBarWidth, height: 1)
                                }
                            }
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    selectedFilter = filter
                                }
                            }
                        }
                    }
                    
                    LazyVStack {
                        ForEach(0 ... 10, id: \.self) { thread in
                            ThreadCell()
                        }
                    }
                }
                .padding(.vertical, 8)
                
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ProfileView()
}
