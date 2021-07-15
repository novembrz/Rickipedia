//
//  Router.swift
//  Rick&Morty
//
//  Created by dasha on 16.06.2021.
//

import SwiftUI

class Router: ObservableObject {
    @Published var currentPage: Page = .home //наблюдатель нажатия
    //@Published мы уведомляем все наблюдающие представления, чтобы они обновляли себя всякий раз, когда  страница,  назначенная  переменной currentView,  изменяется.
}

enum Page: String {
    case home
    case search
    case liked
    case profile
}

