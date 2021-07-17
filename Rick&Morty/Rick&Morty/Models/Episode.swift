//
//  Episode.swift
//  Rick&Morty
//
//  Created by dasha on 11.06.2021.
//

import Foundation

struct Episode: Identifiable, Hashable {
    let id: Int
    let name: String
    let date: String //"air_date"
    let episode: String
    let url: String
    let characters: [String]
}
