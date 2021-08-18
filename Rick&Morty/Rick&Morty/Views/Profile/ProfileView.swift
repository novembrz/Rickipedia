//
//  ProfileView.swift
//  Rick&Morty
//
//  Created by dasha on 18.08.2021.
//

import SwiftUI

struct ProfileView: View {
    
    @State var segmented = 1
    @State var animate = false
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    var body: some View {
        VStack {
            if segmented == 0 {
                SignInView()
            } else if segmented == 1 {
                SignUpView()
            }
            
            Button {} label: {
                VStack(alignment: .center, spacing: 5) {
                    Text(segmented == 0 ? "Don't have an account?" : "Have an account?")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.white)
                    
                    Text(segmented == 0 ? "Register" : "Sign in")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.white)
                }
            }
            .padding(.bottom, height / 70)
        }
        .onAppear() {
            self.animate.toggle()
        }
        .overlay(
            Image("greenPortal")
                .rotationEffect(.init(degrees: self.animate ? 365 : 0))
                .animation(Animation.linear(duration: 7).repeatForever(autoreverses: false))
                .offset(x: width / 2.4, y: -height / 2.5)
        )
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
