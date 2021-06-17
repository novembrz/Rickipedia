//
//  DataFetcher.swift
//  Rick&Morty
//
//  Created by dasha on 25.05.2021.
//

import Foundation

struct DataFetcherServices {
    
    private var urlString = "https://rickandmortyapi.com/api/character"
    
    func fetchAllPersons(completion: @escaping ([Person]?) -> Void) {
        NetworkService.fetchData(urlString: self.urlString, decodeType: .all, completion: completion)
    }
    
    func fetchPerson(id: Int, completion: @escaping (Person?) -> Void) {
        let urlString = urlString + "/" + String(id)
        print("🐠🐠🐠", urlString)
        NetworkService.fetchData(urlString: urlString, decodeType: .person, completion: completion)
    }
    
    func fetchRandomPersons(completion: @escaping ([Person]?) -> Void) {
        var urlString = ""
        
        for _ in 0..<5 {
            let randomInt = Int.random(in: 0..<671)
            
            if urlString == "" {
                urlString = self.urlString + "/" + String(randomInt)
            } else {
                urlString += ",\(randomInt)"
            }
        }
        NetworkService.fetchData(urlString: urlString, decodeType: .random, completion: completion)
    }
}
