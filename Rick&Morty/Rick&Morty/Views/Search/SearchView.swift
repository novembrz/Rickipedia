//
//  SearchView.swift
//  Rick&Morty
//
//  Created by dasha on 05.06.2021.
//

import SwiftUI


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

struct SearchView: View {
    @ObservedObject var viewModel: SearchViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 35) {

            HeaderView(title: "SEARCH", isPerformed: $viewModel.isMenuOpen)
            SearchBarView(viewModel: SearchViewModel())
            
            if viewModel.isMenuOpen {
                FilterMenuView(categories: $viewModel.filterCategories)
            }

            CardsView(searchText: $viewModel.searchText)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SearchViewModel())
    }
}
