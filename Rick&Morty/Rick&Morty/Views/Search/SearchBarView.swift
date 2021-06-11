//
//  SearchBarView.swift
//  Rick&Morty
//
//  Created by dasha on 09.06.2021.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    @Binding var isSearching: Bool
    
    var body: some View {
        HStack {
            HStack {
                TextField("Rick Sanchez", text: $searchText)
                    .colorInvert()
                    .foregroundColor(.black)
                    .accentColor(Color("accentPink"))
                    .padding(.leading, 28)
                    .frame(height: 10)
            }
            .padding()
            .background(Color.gray.opacity(0.3))
            .cornerRadius(10)
            .onTapGesture {
                isSearching = true
            }
            //MARK: Xmark Search
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                    Spacer()
                    
                    if isSearching {
                        Button {
                            searchText = ""
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .padding(.vertical)
                        }
                    }
                }
                .padding(.horizontal, 17)
                .foregroundColor(Color(.systemGray))
            )
            .transition(.move(edge: .trailing))
            .animation(.easeOut)
            
            //MARK: Cancel
            if isSearching {
                Button {
                    isSearching = false
                    searchText = ""
                    
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color("accentGreen"))
                        .padding(.trailing)
                        .padding(.leading, 0)
                }
                .transition(.move(edge: .trailing))
                .animation(.easeOut)
            }
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SearchViewModel())
    }
}
