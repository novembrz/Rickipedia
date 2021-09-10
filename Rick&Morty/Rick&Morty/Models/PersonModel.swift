//
//  Person.swift
//  Rick&Morty
//
//  Created by dasha on 09.09.2021.
//

import Foundation
import SwiftUI

// For all person fetch
struct RickMortyModel: Decodable {
    var results: [PersonModel]
}

struct PersonCard: Identifiable {
    var id: Int
    var uuID = UUID() //var uuID = UUID().uuidString
    let index: Int
    var offset: CGFloat = 0
    
    var person: PersonModel
}

extension PersonCard: Hashable {
    static func == (lhs: PersonCard, rhs: PersonCard) -> Bool {
        return lhs.id == rhs.id
    }
}

struct PersonModel: Decodable {
    let id: Int
    let name: String
    let image: String?
    let status: String
    let species: String
    let type: String
    let gender: String
    let url: String
    
    let origin: LocationModel?
    let location: LocationModel?
    let episode: [String]
}

extension PersonModel: Hashable {
    static func == (lhs: PersonModel, rhs: PersonModel) -> Bool {
        return lhs.id == rhs.id
    }
}
