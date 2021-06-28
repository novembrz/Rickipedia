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
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 50) {
                VStack(spacing: 10) {
                    HeaderView(title: "rickipedia".uppercased(), isPerformed: $isMenuOpen)
                    CarouselBlockView(viewModel: CarouselBlockViewModel())
                }
                LocationBlockView(viewModel: LocationBlockViewModel())
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        TabBarRouterView(viewRouter: Router())
    }
}
