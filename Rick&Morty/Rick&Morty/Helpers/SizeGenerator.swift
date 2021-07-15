//
//  SizeGenerator.swift
//  Rick&Morty
//
//  Created by dasha on 16.06.2021.
//

import Foundation
import SwiftUI

struct SizeGenerator {
    
    static var height = UIScreen.main.bounds.height / 1.8
    
    static func calculateWidth() -> CGFloat {
        let screen = UIScreen.main.bounds.width - 50 // 50 hor padding
        return screen - (2 * 30)
    }
}
