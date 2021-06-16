//
//  NewTabBarView.swift
//  Rick&Morty
//
//  Created by dasha on 16.06.2021.
//

import SwiftUI

struct DefaultView: View {
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
                    Text("Records")
                case "person":
                    Text("person")
                default:
                    Text("User")
                }
                Spacer()
                
                CustomTabBar(viewRouter: viewRouter, selectedTab: $selectedTab)
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct DefaultView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultView(viewRouter: Router())
    }
}

 struct CustomTabBarTempApp: App {
     
     @StateObject var viewRouter = Router()
     
     var body: some Scene {
         WindowGroup {
            DefaultView(viewRouter: viewRouter)
         }
     }
 }
