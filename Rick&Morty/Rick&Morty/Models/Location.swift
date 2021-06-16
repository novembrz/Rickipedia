//
//  File.swift
//  Rick&Morty
//
//  Created by dasha on 11.06.2021.
//

import Foundation

struct Location: Identifiable {
    var uuID = UUID() //var uuID = UUID().uuidString
    let index: Int
    
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let url: String
    let residents: [String]
}
