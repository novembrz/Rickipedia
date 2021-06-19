//
//  String + Ex.swift
//  Rick&Morty
//
//  Created by dasha on 18.06.2021.
//

import Foundation

extension StringProtocol {
    var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
    var firstCapitalized: String { prefix(1).capitalized + dropFirst() }
}
