//
//  Home.swift
//  Rick&Morty
//
//  Created by dasha on 16.06.2021.
//

import SwiftUI

struct HomeView: View {
    
    @State var selectedTab = "house"
    @State var isMenuOpen = false
    
    var body: some View {
        VStack(spacing: 10) {
            HeaderView(title: "RICKIPEDIA", isPerformed: $isMenuOpen)
            Spacer()
            CarouselBlock()
            Spacer()
            
//            ZStack(alignment: .bottom) {
//                CustomTabBar(selectedTab: $selectedTab)
//            }
        }
        .viewSettings()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
