//
//  CardsView.swift
//  Rick&Morty
//
//  Created by dasha on 10.06.2021.
//

import SwiftUI
import Kingfisher

struct CardsView: View {
    
    @State var persons: [Person] = []
    @Binding var searchText: String
    
    var columns: [GridItem] = Array(repeating: .init(.flexible(maximum: 140), spacing: 28, alignment: .top), count: 3)
    
    var body: some View {
    
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns) {
                ForEach((persons).filter({"\($0)".contains(searchText) || searchText.isEmpty}), id: \.self) { person in
                    
                    VStack(spacing: 13) {
                        KFImage(URL(string: person.image ?? defaultImageUrl))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 90, height: 90)
                            .cornerRadius(8)
                        
                        Text(person.name)
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity, idealHeight: 150)
                }
            }
        }
        .animation(.easeIn)
        .transition(.move(edge: .top))
        .onAppear() {
            DataFetcherServices().fetchAllPersons { personArray in
                guard let persons = personArray else {return}
                self.persons = persons
                print("🦖🦖🦖", persons)
            }
        }
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SearchViewModel())
    }
}
