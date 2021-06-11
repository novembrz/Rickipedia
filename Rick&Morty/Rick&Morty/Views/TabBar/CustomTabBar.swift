//
//  CustomTabBar.swift
//  Rick&Morty
//
//  Created by dasha on 28.05.2021.
//

import SwiftUI

//MARK: CustomTabBar

struct CustomTabBar: View {
    
    @Binding var selectedTab: String
    @State var tabPoints: [CGFloat] = []
    
    var body: some View {
        HStack(spacing: 0) {
            TabBarButtons(image: "house", selectedTab: $selectedTab, tabPoints: $tabPoints)
            TabBarButtons(image: "eye", selectedTab: $selectedTab, tabPoints: $tabPoints)
            TabBarButtons(image: "suit.heart", selectedTab: $selectedTab, tabPoints: $tabPoints)
            TabBarButtons(image: "person", selectedTab: $selectedTab, tabPoints: $tabPoints)
        }
        .padding()
        .background(
            Color.white
                .clipShape(TabCurve(tabPoint: getCurvePoint() - 15))
        )
        .overlay(
            Circle()
                .fill(Color.white)
                .frame(width: 10, height: 10)
                .offset(x: getCurvePoint() - 20)
            ,alignment: .bottomLeading
        )
        .cornerRadius(50)
        .padding(.horizontal, 15)
        .padding(.bottom, 30)
    }
    
    func getCurvePoint() -> CGFloat {
        if tabPoints.isEmpty {
            return 10
        } else {
            switch selectedTab {
            case "house":
                return tabPoints[3]//[0]
            case "eye":
                return tabPoints[2]//[1]
            case "suit.heart":
                return tabPoints[1]//[2]
            case "person":
                return tabPoints[0]//[3]
            default:
                return tabPoints[0]
            }
        }
    }
}
