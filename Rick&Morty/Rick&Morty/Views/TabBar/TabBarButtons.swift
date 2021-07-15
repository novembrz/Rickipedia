//
//  TabBarButtons.swift
//  Rick&Morty
//
//  Created by dasha on 05.06.2021.
//

import Foundation
import SwiftUI

struct TabBarButtons: View {
    
    @StateObject var viewRouter: Router
    let assignedPage: Page
    var image: String
    @Binding var selectedTab: String
    @Binding var tabPoints: [CGFloat]
    
    var body: some View {
        GeometryReader { reader -> AnyView in
            
            let midX = reader.frame(in: .global).midX
            
            DispatchQueue.main.async {
                if tabPoints.count <= 4 {
                    tabPoints.append(midX)
                }
            }
            return AnyView (
                Button {
                    withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.5, blendDuration: 0.5)) {
                        selectedTab = image
                    }
                } label: {
                    Image(systemName: "\(image)\(selectedTab == image ? ".fill" : "")") //при нажатии картинка заменяется на такую же филл
                        .font(.system(size: 22, weight: .medium))
                        .foregroundColor(Color("GrayBgColor")) //selected color
                        .offset(y: selectedTab == image ? -10 : 0) //сдвиг icon вниз/вверх
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .contentShape(Rectangle())//maxFrame
                .onTapGesture {
                    viewRouter.currentPage = assignedPage
                }
            )
        }
        .frame(height: 35) //maxheight
    }
}
