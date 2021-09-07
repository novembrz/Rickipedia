//
//  DataFetcherServices.swift
//  Rick&Morty
//
//  Created by dasha on 07.09.2021.
//

import Foundation

struct DataFetcherServices {
    
    static func fetchAllPersons(urlString: String, completion: @escaping (RickMortyModel?) -> Void){
        NetworkManager.fetchData(urlString: urlString, completion: completion)
    }
}
