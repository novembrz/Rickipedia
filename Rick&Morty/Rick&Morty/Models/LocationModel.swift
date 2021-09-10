//
//  Location.swift
//  Rick&Morty
//
//  Created by dasha on 09.09.2021.
//

import Foundation

struct LocationModel: Decodable {
    var name: String
    var url: String
    
    let id: Int?
    let type: String?
    let dimension: String?
    let residents: [String]? //links foe persons
}

extension LocationModel: Hashable {
    static func == (lhs: LocationModel, rhs: LocationModel) -> Bool {
        return lhs.name == rhs.name
    }
}
