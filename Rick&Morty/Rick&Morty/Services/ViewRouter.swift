//
//  ViewRouter.swift
//  Rick&Morty
//
//  Created by dasha on 05.06.2021.
//

import Foundation
import SwiftUI


class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .home //страница по умолчанию
}

enum Page {
     case home
     case search
     case liked
     case profile
 }
