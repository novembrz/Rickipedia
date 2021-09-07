//
//  SignUpView.swift
//  Rick&Morty
//
//  Created by dasha on 18.08.2021.
//

import SwiftUI

final class SignUpViewModel: ObservableObject {
    
    @Published var name = ""
    @Published var source = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    
//    func signupButtonTapped() {
//        AuthService.shared.register(email: source, password: password, confirmPassword: confirmPassword) { (result) in
//
//            switch result{
//            case .success(_):
//                print("")
//                //self.createAlert(with: "Successful!", message: "You are registered!") {
//                    //self.present(SetupProfileViewController(), animated: true, completion: nil)
//                }
//            case .failure(let error):
//            print(error)
//                //self.createAlert(with: "Error!", message: error.localizedDescription)
//            }
//        }
//    }
}

struct SignUpView: View {
    
    @ObservedObject var viewModel = SignUpViewModel()
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
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
                        
                        Text("Sign up")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                    }
                    
                    VStack(alignment: .trailing, spacing: 37) {
                        
                        AuthTextFieldStyle(text: $viewModel.name, placeholder: "Your name", imageName: "marsian") {
                            TextField("", text: $viewModel.name)
                        }
                        
                        AuthTextFieldStyle(text: $viewModel.source, placeholder: "Phone / E-mail", imageName: "rocket") {
                            TextField("", text: $viewModel.source)
                        }
                        
                        AuthTextFieldStyle(text: $viewModel.password, placeholder: "Password", imageName: "galaxy") {
                            TextField("", text: $viewModel.password)
                        }
                        
                        AuthTextFieldStyle(text: $viewModel.confirmPassword, placeholder: "Confirm password", imageName: "galaxy") {
                            TextField("", text: $viewModel.confirmPassword)
                        }
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
                                .background(LinearGradient.rmGradient())
                                .cornerRadius(8)
                        }
                    }
                    
                    VStack(spacing: 21) {
                        Text("Or register via social networks")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(.white)
                        
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
