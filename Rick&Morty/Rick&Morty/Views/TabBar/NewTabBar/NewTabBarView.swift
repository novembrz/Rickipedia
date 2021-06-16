//
//  NewTabBarView.swift
//  Rick&Morty
//
//  Created by dasha on 16.06.2021.
//

import SwiftUI

struct DefaultView: View {
    @StateObject var viewRouter: Router
    
    var body: some View {
        GeometryReader { geometry in //возможность знать ширину и высоту  ContentView в  зависимости от конкретного устройства
            VStack {
                Spacer()
                switch viewRouter.currentPage {
                case .home:
                    HomeView()
                case .liked:
                    SearchView(viewModel: SearchViewModel())
                case .records:
                    Text("Records")
                case .user:
                    Text("User")
                }
                Spacer()
                
                HStack {
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .home, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "homekit", tabName: "Home")
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .liked, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "heart", tabName: "liked")
                    
                    ZStack {
                        Circle()
                            .foregroundColor(.white)
                            .frame(width: geometry.size.width/7, height: geometry.size.width/7)
                            .shadow(radius: 4)
                        
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width/7-6 , height: geometry.size.width/7-6)
                            .foregroundColor(Color.black)
                    }
                    .offset(y: -geometry.size.height/8/2)
                    
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .records, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "waveform", tabName: "Records")
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .user, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "person.crop.circle", tabName: "Account")
                }
                .frame(width: geometry.size.width, height: geometry.size.height/8) //высота 1/8 высоты экрана. За счет geometry
                .background(Color.yellow.shadow(radius: 2))
                
            }
            .edgesIgnoringSafeArea(.bottom)
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

struct TabBarIcon: View {
    
    @StateObject var viewRouter: Router
    let assignedPage: Page
    let width, height: CGFloat
    let systemIconName, tabName: String
    
    var body: some View {
        VStack {
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 10)
            Text(tabName)
                .font(.footnote)
            Spacer()
        }
        .foregroundColor(viewRouter.currentPage == assignedPage ? .white : .black.opacity(0.8))
        .padding(.horizontal, -4)
        .onTapGesture {
            viewRouter.currentPage = assignedPage
        }
    }
}

