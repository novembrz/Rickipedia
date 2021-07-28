//
//  SearchView.swift
//  Rick&Morty
//
//  Created by dasha on 05.06.2021.
//

import SwiftUI

//MARK: - ViewModel
final class SearchViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var isSearching = false
    @Published var isMenuOpen = false
    @Published var selctedCategory: String = ""
    
    var filterCategories = ["person", "marsian", "planet", "starship"]
    var linerGradient = LinearGradient(gradient: Gradient(colors: [Color("accentBlue"), Color("accentGreen")]), startPoint: .top, endPoint: .bottom)
    
    func randomString() -> String {
        let words = ["Evil Beth Clone", "Venzenulon 7", "Gromflom Prime", "Rick D. Sanchez III", "Birdperson", "Cowboy Morty", "Fascist Mr. President", "Unity", "Earth (C-137)"]
        return words.randomElement()!
    }
}

//MARK: - View
struct SearchView: View {
    @ObservedObject var viewModel: SearchViewModel
    
    var body: some View {
        ZStack {
            CardsView(searchText: $viewModel.searchText)
            
            VStack(alignment: .leading, spacing: 20) {
                HeaderView(title: "search".uppercased(), isPerformed: $viewModel.isMenuOpen)
                SearchBarView(viewModel: SearchViewModel())
                
                if viewModel.isMenuOpen {
                    FilterMenuView(categories: $viewModel.filterCategories)
                }
                
                Spacer()
            }
            .padding(.top, UIScreen.main.bounds.size.height / 17.5)
        }
    }
}

//MARK: - Previews
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SearchViewModel())
    }
}
