//
//  CarouselView.swift
//  Rick&Morty
//
//  Created by dasha on 21.05.2021.
//

import SwiftUI

//MARK: CarouselView
struct HomeView: View {
    
    @State var selectedTab = "house"
    
    var body: some View {
        VStack(spacing: 10) {
            HomeHeaderView()
            CarouselBlock()
            Spacer()
            
            ZStack(alignment: .bottom) {
                CustomTabBar(selectedTab: $selectedTab)
            }
            
        }
        .foregroundColor(.white)
        .background(Color("GrayBgColor"))
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
