//
//  SearchView.swift
//  Rick&Morty
//
//  Created by dasha on 05.06.2021.
//

import SwiftUI

var array = ["Ann", "Anton", "Figma", "Fillip", ]

struct SearchView: View {
    @State var searchText = ""
    @State var isSearching = false
    @State var isMenuOpen = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 35) {
            
            HeaderView(title: "SEARCH", isPerformed: $isMenuOpen)
            SearchBarView(searchText: $searchText, isSearching: $isSearching)
            
            if isMenuOpen {
                FilterMenuView()
            }

            ScrollView(.vertical, showsIndicators: false) {
                ForEach((array).filter({"\($0)".contains(searchText) || searchText.isEmpty}), id: \.self) { object in
                    HStack {
                        Text("\(object)")
                        Spacer()
                    }
                    .padding(.vertical)
                }
            }
            .animation(.easeIn)
            .transition(.move(edge: .top))
        }
        .viewSettings()
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
