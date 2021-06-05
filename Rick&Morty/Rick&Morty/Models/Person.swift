//
//  Person.swift
//  Rick&Morty
//
//  Created by dasha on 23.05.2021.
//

import Foundation
import SwiftUI

struct Person: Identifiable {
    var uuID = UUID() //var uuID = UUID().uuidString
    let index: Int
    var offset: CGFloat = 0
    
    let name: String
    let id: Int
    let image: String
}
