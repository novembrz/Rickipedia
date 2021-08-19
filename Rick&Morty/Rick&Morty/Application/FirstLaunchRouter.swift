//
//  FirstLaunchRouter.swift
//  Rick&Morty
//
//  Created by dasha on 19.08.2021.
//

import SwiftUI

class FirstLaunchRouter: ObservableObject {
    
    @Published var currentPage: String
    
    init() {
        if !UserDefaults.standard.bool(forKey: "didLaunchBefore") {
            UserDefaults.standard.set(true, forKey: "didLaunchBefore")
            self.currentPage = "signInView"
        } else {
            self.currentPage = "homeView"
        }
    }
}

struct MotherView: View {
    
    @EnvironmentObject var router: FirstLaunchRouter
    @State var isShow = true
    
    var body: some View {
        VStack {
            if router.currentPage == "signInView" {
                VStack {
                    TabBarRouterView(viewRouter: Router())
                }
                .sheet(isPresented: $isShow) {
                    LoginPageView(addCloseButton: true)
                        .viewSettings()
                }
            } else if router.currentPage == "homeView"{
                TabBarRouterView(viewRouter: Router())
            }
        }
    }
}
