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
    @Published var selectedCard = Person(index: 0, id: 0, name: "", image: "", status: "", species: "", type: "", gender: "", url: "")
}
