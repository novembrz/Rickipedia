//
//  NewTabBarView.swift
//  Rick&Morty
//
//  Created by dasha on 16.06.2021.
//

import SwiftUI

enum Page: String {
    case home
    case search
    case liked
    case profile
}

class Router: ObservableObject {
    @Published var currentPage: Page = .home //наблюдатель нажатия
    //@Published мы уведомляем все наблюдающие представления, чтобы они обновляли себя всякий раз, когда  страница,  назначенная  переменной currentView,  изменяется.
}

struct TabBarRouterView: View {
    @StateObject var viewRouter: Router
    @State var selectedTab = "house"
    
    var body: some View {
        GeometryReader { geometry in //возможность знать ширину и высоту  ContentView в  зависимости от конкретного устройства
            VStack {
                switch selectedTab {
                case "house":
                    HomeView()
                case "eye":
                    SearchView(viewModel: SearchViewModel())
                case "suit.heart":
                    FavouriteView()
                case "person":
                    Text("Profile")
                default:
                    Text("Error")
                }
                
                CustomTabBar(viewRouter: viewRouter, selectedTab: $selectedTab)
            }
        }
        .viewSettings()
    }
}

struct DefaultView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarRouterView(viewRouter: Router())
    }
}

// struct CustomTabBarTempApp: App {
//     
//     @StateObject var viewRouter = Router()
//     
//     var body: some Scene {
//         WindowGroup {
//            TabBarRouterView(viewRouter: viewRouter)
//         }
//     }
// }
