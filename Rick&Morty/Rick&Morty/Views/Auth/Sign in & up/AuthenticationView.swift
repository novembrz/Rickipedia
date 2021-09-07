//
//  ProfileView.swift
//  Rick&Morty
//
//  Created by dasha on 18.08.2021.
//

import SwiftUI

struct AuthenticationView: View {
    
    @State var isSignIn = true
    @State var animate = false
    
    var addCloseButton: Bool
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if isSignIn {
                SignInView(authService: .init(), addCloseButton: addCloseButton)
                    .transition(.move(edge: isSignIn ? .trailing : .leading))
                    .animation(.easeInOut)
                
            } else {
                SignUpView(addCloseButton: addCloseButton)
                    .transition(.move(edge: isSignIn ? .trailing : .leading))
                    .animation(.easeInOut)
            }
            
            Button {
                isSignIn.toggle()
            } label: {
                HStack(alignment: .center, spacing: 5) {
                    Text(isSignIn ? "Don't have an account?" : "Have an account?")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.white)

                    Text(isSignIn ? "Register" : "Sign in")
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
                .rotationEffect(.init(degrees: self.animate ? 360 : 0))
                .animation(Animation.linear(duration: 7).repeatForever(autoreverses: false))
                .offset(x: width / 2.4, y: -height / 2.5)
        )
    }
}

struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView(addCloseButton: false)
            .viewSettings()
    }
}
