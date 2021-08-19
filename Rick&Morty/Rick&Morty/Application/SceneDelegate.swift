//
//  SceneDelegate.swift
//  Rick&Morty
//
//  Created by dasha on 21.05.2021.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        //let contentView = SearchView(viewModel: SearchViewModel())
        //let contentView = HomeView()
        let contentView = TabBarRouterView(viewRouter: Router())

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = HostingController(rootView: MotherView().environmentObject(FirstLaunchRouter()))
            //window.rootViewController = HostingController(rootView: contentView.environmentObject(FirstLaunchRouter()))
            //window.rootViewController = HostingController(rootView: contentView)
            
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}

class HostingController<ContentView>: UIHostingController<ContentView> where ContentView : View {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
