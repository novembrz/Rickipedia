//
//  CarouselViewModel.swift
//  Rick&Morty
//
//  Created by dasha on 27.05.2021.
//

import SwiftUI

class CarouselViewModel: ObservableObject {
    
    @Published var persons: [Person] = []
    @Published var showCard = false
    @Published var selectedCard = Person(index: 0, name: "", id: 0, image: "")
    
    func fetchData() {
        DataFetcherServices.fetchAllPersons(urlString: "https://rickandmortyapi.com/api/character") { personArray in
            guard let persons = personArray else {return}
            self.persons = persons
            print("🦖🦖🦖", persons)
        }
    }
}
