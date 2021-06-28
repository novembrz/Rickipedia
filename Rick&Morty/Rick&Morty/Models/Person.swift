//
//  Person.swift
//  Rick&Morty
//
//  Created by dasha on 23.05.2021.
//

import Foundation
import SwiftUI

struct Person: Identifiable, Hashable {
    var uuID = UUID() //var uuID = UUID().uuidString
    let index: Int
    var offset: CGFloat = 0
    
    let id: Int
    let name: String
    let image: String?
    let status: String
    let species: String
    let type: String
    let gender: String
    let url: String
    
    let origin: PersonOrigin?
    let location: PersonLocation?
    let episode: [String]
}

struct PersonOrigin: Hashable {
    let name: String
    let url: String
}

struct PersonLocation: Hashable {
    let name: String
    let url: String
}
