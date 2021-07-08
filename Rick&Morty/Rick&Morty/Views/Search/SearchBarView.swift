//
//  SearchBarView.swift
//  Rick&Morty
//
//  Created by dasha on 09.06.2021.
//

import SwiftUI

struct SearchBarView: View {
    
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        HStack {
            HStack { //MARK: Search TF
                TextField(viewModel.randomString(), text: $viewModel.searchText)
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
                viewModel.isSearching = true
            }
            //MARK: Xmark & Search
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                    Spacer()
                    
                    if viewModel.isSearching {
                        Button {
                            viewModel.searchText = ""
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
            if viewModel.isSearching {
                Button {
<<<<<<< HEAD
                    viewModel.isSearching = false
                    viewModel.searchText = ""
=======
                    isSearching = false
                    searchText = ""
                    
>>>>>>> parent of fa54670 (Refactored the NetworkService)
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color("accentGreen"))
                        .padding(.trailing)
                        .padding(.leading, 10)
                }
                .transition(.move(edge: .trailing))
                .animation(.easeOut)
            }
        }
    }
}

//MARK: - Previews
struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SearchViewModel())
    }
}
