//
//  LinerGradient + Extension.swift
//  Rick&Morty
//
//  Created by dasha on 20.08.2021.
//

import SwiftUI

extension LinearGradient {
    static func rmGradient() -> LinearGradient {
        return LinearGradient(gradient: Gradient(colors: [Color("accentBlue"), Color("accentGreen")]), startPoint: .leading, endPoint: .trailing)
    }
}
