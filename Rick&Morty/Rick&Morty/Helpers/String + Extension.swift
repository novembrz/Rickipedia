//
//  Strings.swift
//  Rick&Morty
//
//  Created by dasha on 16.06.2021.
//

import Foundation

var defaultImageUrl = "https://pristor.ru/wp-content/uploads/2018/11/%D0%A0%D0%B8%D0%BA-%D0%B8-%D0%9C%D0%BE%D1%80%D1%82%D0%B8-%D0%BA%D0%BB%D0%B0%D1%81%D1%81%D0%BD%D1%8B%D0%B5-%D0%B8-%D0%BA%D1%80%D1%83%D1%82%D1%8B%D0%B5-%D0%BA%D0%B0%D1%80%D1%82%D0%B8%D0%BD%D0%BA%D0%B8-%D0%BD%D0%B0-%D0%B0%D0%B2%D1%83-%D0%B8-%D0%BD%D0%B0-%D0%B7%D0%B0%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D1%83-19-576x1024.jpg"


class StringsConvert {
    
    func makeOneURL(urls: [String], comp: @escaping (String, Int) -> Void ) {
        var urlString = ""
        var count = 0
        
        for url in urls {
            guard let id = url.components(separatedBy: "/").last else { return }
            count += 1
            
            if urlString == "" {
                urlString = "https://rickandmortyapi.com/api/character/\(id)"
            } else {
                urlString += ",\(id)"
            }
        }
        comp(urlString, count)
    }
}
