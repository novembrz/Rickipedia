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
    
    //let origin: PersonOrigin //место рождения/ откуда пришел
    //let location: PersonLocation //шде мы его увидели
    //let episode: [String]
}

struct PersonOrigin {
    let name: String
    let url: String
}

struct PersonLocation {
    let name: String
    let url: String
}

/*
 "id": 1,
       "name": "Rick Sanchez",
       "status": "Alive",
       "species": "Human",
       "type": "",
       "gender": "Male",
       "origin": {
         "name": "Earth",
         "url": "https://rickandmortyapi.com/api/location/1"
       },
       "location": {
         "name": "Earth",
         "url": "https://rickandmortyapi.com/api/location/20"
       },
       "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
       "episode": [
         "https://rickandmortyapi.com/api/episode/1",
         "https://rickandmortyapi.com/api/episode/2",
         // ...
       ],
       "url": "https://rickandmortyapi.com/api/character/1",
       "created": "2017-11-04T18:48:46.250Z"
     },
 */
