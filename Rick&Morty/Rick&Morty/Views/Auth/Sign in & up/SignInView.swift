//
//  SignUpView.swift
//  Rick&Morty
//
//  Created by dasha on 18.08.2021.
//

import SwiftUI

//MARK: SignInView

struct SignInView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var authService: AuthenticationService
    
    @State var source = ""
    @State var password = ""
    
    var addCloseButton: Bool
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
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
                        
                        Text("Sign in")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                    }
                    
                    VStack(alignment: .trailing, spacing: 37) {
                        AuthTextFieldStyle(text: $password, placeholder: "Phone / E-mail", imageName: "rocket") {
                            TextField("", text: $source)
                        }
                        
                        AuthTextFieldStyle(text: $password, placeholder: "Password", imageName: "galaxy") {
                            TextField("", text: $password)
                        }
                        
                        Button {} label: {
                            Text("Forgot password?")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                        }
                    }
                }
                
                Button {
//                    authService.emailSignIn(email: source, password: password) { result in
//                        switch result {
//                        case .success(_):
//                            print("")
//                        case .failure(_):
//                            print("")
//                        }
//                    }
                } label: {
                    ZStack {
                        Text("Sign in".uppercased())
                            .font(.system(size: 16, weight: .bold))
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 12)
                            .foregroundColor(Color("GrayBgColor"))
                            .frame(height: 50)
                            .background(LinearGradient.rmGradient())
                            .cornerRadius(8)
                    }
                }
                
                HStack(spacing: 40) {
                    Button {} label: {
                        Image("facebook")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                    }
                    
                    Button {} label: {
                        Image("google")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                    }
                    
                    Button {} label: {
                        Image("apple")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                    }
                }
            }
            
            Spacer()
        }
        .padding(.top, addCloseButton ? 25 : height / 11)
    }
}

//MARK: SignInView_Previews

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(authService: .init(), addCloseButton: false)
            .viewSettings()
    }
}
