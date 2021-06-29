//
//  ImageExists.swift
//  Rick&Morty
//
//  Created by dasha on 28.06.2021.
//

import Foundation
import SwiftUI

func imageExists(imageName: String) -> Bool {
    let imageExists: Bool = UIImage(named: imageName) != nil
    return imageExists
}
