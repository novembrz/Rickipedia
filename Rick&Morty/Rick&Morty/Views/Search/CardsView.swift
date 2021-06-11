//
//  CardsView.swift
//  Rick&Morty
//
//  Created by dasha on 10.06.2021.
//

import SwiftUI

struct CardsView: View {
    
    @Binding var searchText: String
    var columns: [GridItem] = Array(repeating: .init(.flexible(maximum: 140), spacing: 28, alignment: .top), count: 3)
    
    var body: some View {
    
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns) {
                ForEach((array).filter({"\($0)".contains(searchText) || searchText.isEmpty}), id: \.self) { object in
                    
                    VStack(spacing: 13) {
                        Rectangle()
                            .frame(width: 90, height: 90)
                            .cornerRadius(8)
                        
                        Text(object)
                            .lineLimit(2)
                    }
                    .frame(maxWidth: .infinity, idealHeight: 150)
                }
            }
        }
        .animation(.easeIn)
        .transition(.move(edge: .top))
        
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SearchViewModel())
    }
}
