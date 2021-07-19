//
//  ViewModifiers.swift
//  Rick&Morty
//
//  Created by dasha on 09.06.2021.
//

import SwiftUI

struct ViewSettings: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .padding()
            .background(Color("GrayBgColor"))
            .edgesIgnoringSafeArea(.all)
    }
}

extension View {
    func viewSettings() -> some View {
        self.modifier(ViewSettings())
    }
}

/*
 Text("Hello World")
     .titleStyle()
 */
