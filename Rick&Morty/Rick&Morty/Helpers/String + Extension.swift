//
//  Strings.swift
//  Rick&Morty
//
//  Created by dasha on 16.06.2021.
//

import Foundation

class StringsConvert {
    enum Urls: String {
        case episode = "https://rickandmortyapi.com/api/episode/"
        case char = "https://rickandmortyapi.com/api/character/"
    }
    
    func makeOneURL(urls: [String], type: Urls, comp: @escaping (String, Int) -> Void ) {
        var urlString = ""
        var count = 0
        
        for url in urls {
            guard let id = url.components(separatedBy: "/").last else { return }
            count += 1
            
            if urlString == "" {
                urlString = type.rawValue + String(id)
            } else {
                urlString += ",\(id)"
            }
        }
        comp(urlString, count)
    }
}
