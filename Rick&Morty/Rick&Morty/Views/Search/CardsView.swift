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
                        KFImage(URL(string: person.image ?? "https://pristor.ru/wp-content/uploads/2018/11/%D0%A0%D0%B8%D0%BA-%D0%B8-%D0%9C%D0%BE%D1%80%D1%82%D0%B8-%D0%BA%D0%BB%D0%B0%D1%81%D1%81%D0%BD%D1%8B%D0%B5-%D0%B8-%D0%BA%D1%80%D1%83%D1%82%D1%8B%D0%B5-%D0%BA%D0%B0%D1%80%D1%82%D0%B8%D0%BD%D0%BA%D0%B8-%D0%BD%D0%B0-%D0%B0%D0%B2%D1%83-%D0%B8-%D0%BD%D0%B0-%D0%B7%D0%B0%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D1%83-19-576x1024.jpg"))
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
            DataFetcherServices.fetchAllPersons { personArray in
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
