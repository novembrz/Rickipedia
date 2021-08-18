//
//  SignUpView.swift
//  Rick&Morty
//
//  Created by dasha on 18.08.2021.
//

import SwiftUI

struct SignInView: View {
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    var linerGradient = LinearGradient(gradient: Gradient(colors: [Color("accentBlue"), Color("accentGreen")]), startPoint: .leading, endPoint: .trailing)
    
    var body: some View {
        VStack {
            VStack(spacing: height / 15) {
                VStack(alignment: .leading, spacing: height / 12) {
                    VStack(alignment: .leading, spacing: height / 20) {
                        Button {
                            
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 18, height: 18)
                        }
                        
                        Text("Sign in")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                    }
                    
                    VStack(alignment: .trailing, spacing: 37) {
                        CustomTextField(placeholder: "Phone / E-mail", imageName: "rocket")
                        CustomTextField(placeholder: "Password", imageName: "galaxy")
                        
                        Text("Forgot password?")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white)
                    }
                }
                
                Button { } label: {
                    ZStack {
                        Text("Sign in".uppercased())
                            .font(.system(size: 16, weight: .bold))
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 12)
                            .foregroundColor(Color("GrayBgColor"))
                            .frame(height: 50)
                            .background(linerGradient)
                            .cornerRadius(8)
                    }
                }
                
                HStack(spacing: 34) {
                    Circle()
                        .frame(width: 40, height: 40)
                    Circle()
                        .frame(width: 40, height: 40)
                    Circle()
                        .frame(width: 40, height: 40)
                }
            }
            
            Spacer()
        }
        .padding(.top, UIScreen.main.bounds.size.height / 17.5)
        .viewSettings()
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
