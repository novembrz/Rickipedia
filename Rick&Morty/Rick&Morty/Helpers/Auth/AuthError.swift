//
//  AuthError.swift
//  Rick&Morty
//
//  Created by dasha on 20.08.2021.
//

import Foundation

enum AuthError {
    case notFilled
    case invalidEmail
    case passwordsNotMatched
    case unknownError
    case serverError
}

extension AuthError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFilled:
            return NSLocalizedString("Fill in all the fields", comment: "") //"Заполните все поля"
        case .invalidEmail:
            return NSLocalizedString("The mail format is not valid", comment: "") //"Формат почты не является допустимым"
        case .passwordsNotMatched:
            return NSLocalizedString("Passwords do not match", comment: "") //"Пароли не совпадают"
        case .unknownError:
            return NSLocalizedString("Unknown error", comment: "") //"Неизвестная ошибка"
        case .serverError:
            return NSLocalizedString("Server error", comment: "") //"Ошибка сервера"
        }
    }
}
