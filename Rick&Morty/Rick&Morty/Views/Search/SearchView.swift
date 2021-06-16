//
//  SearchView.swift
//  Rick&Morty
//
//  Created by dasha on 05.06.2021.
//

import SwiftUI

final class SearchViewModel: ObservableObject {
    var filterCategories = ["person", "marsian", "planet", "starship"]
}

struct SearchView: View {
    @State var searchText = ""
    @State var isSearching = false
    @State var isMenuOpen = false
    
    @ObservedObject var viewModel: SearchViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 35) {
            
            HeaderView(title: "SEARCH", isPerformed: $isMenuOpen)
            SearchBarView(searchText: $searchText, isSearching: $isSearching)
            
            if isMenuOpen {
                FilterMenuView(categories: $viewModel.filterCategories)
            }

            CardsView(searchText: $searchText)
        }
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SearchViewModel())
    }
}
