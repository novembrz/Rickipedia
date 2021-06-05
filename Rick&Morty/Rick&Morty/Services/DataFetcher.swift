//
//  DataFetcher.swift
//  Rick&Morty
//
//  Created by dasha on 25.05.2021.
//

import Foundation

struct DataFetcherServices {
    
    static func fetchAllPersons(urlString: String, completion: @escaping ([Person]?) -> Void) {
        NetworkService.fetchData(urlString: urlString, decodeType: .all, completion: completion)
    }
    
    static func fetchRandomPersons(completion: @escaping ([Person]?) -> Void) {

        var urlString = ""
        
        for _ in 0..<5 {
            let randomInt = Int.random(in: 0..<671)
            
            if urlString == "" {
                urlString = "https://rickandmortyapi.com/api/character/\(randomInt)"
            } else {
                urlString += ",\(randomInt)"
            }
        }
        NetworkService.fetchData(urlString: urlString, decodeType: .random, completion: completion)
    }
}
