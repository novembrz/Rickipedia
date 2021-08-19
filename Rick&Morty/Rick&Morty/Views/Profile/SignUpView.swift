//
//  SignUpView.swift
//  Rick&Morty
//
//  Created by dasha on 18.08.2021.
//

import SwiftUI

struct SignUpView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var addCloseButton: Bool
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    var linerGradient = LinearGradient(gradient: Gradient(colors: [Color("accentBlue"), Color("accentGreen")]), startPoint: .leading, endPoint: .trailing)
    
    
    var body: some View {
        VStack {
            VStack(spacing: height / 15) {
                VStack(alignment: .leading, spacing: addCloseButton ? height / 12 : height / 10) {
                    VStack(alignment: .leading, spacing: height / 20) {
                        if addCloseButton {
                            Button {
                                self.presentationMode.wrappedValue.dismiss()
                            } label: {
                                Image(systemName: "xmark")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .frame(width: 18, height: 18)
                            }
                        }
                        
                        Text("Sign up")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                    }
                    
                    VStack(alignment: .trailing, spacing: 37) {
                        CustomTextField(placeholder: "Your name", imageName: "marsian")
                        CustomTextField(placeholder: "Phone / E-mail", imageName: "rocket")
                        CustomTextField(placeholder: "Password", imageName: "galaxy")
                        CustomTextField(placeholder: "Confirm password", imageName: "galaxy")
                    }
                }
                
                VStack(spacing: 27) {
                    Button { } label: {
                        ZStack {
                            Text("Create account".uppercased())
                                .font(.system(size: 16, weight: .bold))
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal, 12)
                                .foregroundColor(Color("GrayBgColor"))
                                .frame(height: 50)
                                .background(linerGradient)
                                .cornerRadius(8)
                        }
                    }
                    
                    VStack(spacing: 21) {
                        Text("Or register via social networks")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(.white)
                        
                        HStack(spacing: 34) {
                            Circle()
                                .frame(width: 40, height: 40)
                            Circle()
                                .frame(width: 40, height: 40)
                            Circle()
                                .frame(width: 40, height: 40)
                        }
                    }
                }
            }
            
            Spacer()
        }
        .padding(.top, addCloseButton ? 25 : height / 11)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(addCloseButton: false)
            .viewSettings()
    }
}
