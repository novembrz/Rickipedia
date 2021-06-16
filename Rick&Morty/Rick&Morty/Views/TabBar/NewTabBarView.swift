//
//  NewTabBarView.swift
//  Rick&Morty
//
//  Created by dasha on 16.06.2021.
//

import SwiftUI

struct NewTabBarView: View {
    @StateObject var viewRouter: Router
    @State var selectedTab = "house"
    
    var body: some View {
        GeometryReader { geometry in //возможность знать ширину и высоту  ContentView в  зависимости от конкретного устройства
            VStack {
                Spacer()
                switch selectedTab {
                case "house":
                    HomeView()
                case "eye":
                    SearchView(viewModel: SearchViewModel())
                case "suit.heart":
                    Text("Liked")
                case "person":
                    Text("Profile")
                default:
                    Text("Error")
                }
                Spacer()
                
                CustomTabBar(viewRouter: viewRouter, selectedTab: $selectedTab)
            }
            .viewSettings()
        }
    }
}

struct DefaultView_Previews: PreviewProvider {
    static var previews: some View {
        NewTabBarView(viewRouter: Router())
    }
}

 struct CustomTabBarTempApp: App {
     
     @StateObject var viewRouter = Router()
     
     var body: some Scene {
         WindowGroup {
            NewTabBarView(viewRouter: viewRouter)
         }
     }
 }
