//
//  AuthenticationService.swift
//  Rick&Morty
//
//  Created by dasha on 19.08.2021.
//

import UIKit
import Firebase
import FirebaseAuth
import SwiftUI

class AuthenticationService: ObservableObject {
    @Published var code: String?
    @Published var errorMessage: String?
    @Published var isError = false
    @Published var goToVerify = false
    
    static let shared = AuthenticationService()
    private var auth = Auth.auth()
    
    //MARK: Email
    // - Регистрация по почте
    func emailRegister(email: String?, password: String?, confirmPassword: String?, completion: @escaping (Result<User, Error>) -> Void){
        
        guard Validators.isFilled(email: email, password: password, confirmPassword: confirmPassword) else {
            completion(.failure(AuthError.notFilled))
            return
        }
        
        guard password!.lowercased() == confirmPassword!.lowercased() else {
            completion(.failure(AuthError.passwordsNotMatched))
            return
        }
        
        guard Validators.isSimpleEmail(email!) else {
            completion(.failure(AuthError.invalidEmail))
            return
        }
        
        auth.createUser(withEmail: email!, password: password!) { (result, error) in
            guard let result = result else {
                completion(.failure(error!))
                return
            }
            completion(.success(result.user))
        }
    }
    
    // - Вход по почте
    func emailSignIn(email: String?, password: String?, completion: @escaping (Result<User, Error>) -> Void){
        
        guard let email = email, let password = password else {
            completion(.failure(AuthError.notFilled))
            return
        }
        
        auth.signIn(withEmail: email, password: password) { (result, error) in
            guard let result = result else {
                completion(.failure(error!))
                return
            }
            completion(.success(result.user))
        }
    }
    
    //MARK: Phone
    // - Код подтверждения телефон
    func sendCode(number: String) {
        PhoneAuthProvider.provider().verifyPhoneNumber(number, uiDelegate: nil) { code, error in
            if let error = error {
                self.isError = true
                self.errorMessage = "Incorrect code: \(error.localizedDescription)"
                return
            }
            self.code = code
            self.goToVerify = true
        }
    }
}
    
    //import GoogleSignIn
//    func googleSignIn(user: GIDGoogleUser!, error: Error!, completion: @escaping (Result<User, Error>) -> Void){
//
//        if let error = error {
//            completion(.failure(error))
//            return
//        }
//
//        guard let authUser = user.authentication else {return}
//        let credential = GoogleAuthProvider.credential(withIDToken: authUser.idToken, accessToken: authUser.accessToken)
//
//        auth.signIn(with: credential) { (result, error) in
//
//            guard let result = result else {
//                completion(.failure(error!))
//                return
//            }
//            completion(.success(result.user))
//        }
//    }
//}
