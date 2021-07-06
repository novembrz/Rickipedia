//
//  DataFetcher.swift
//  Rick&Morty
//
//  Created by dasha on 25.05.2021.
//

import Foundation

struct DataFetcherServices {
    
    private var urlString = "https://rickandmortyapi.com/api/character"
    private var urlStringLocation = "https://rickandmortyapi.com/api/location"
    private var urlStringEpisode = "https://rickandmortyapi.com/api/episode"
    
    //MARK: Person
    func fetchAllPersons(completion: @escaping ([Person]?) -> Void) {
        NetworkService.fetchData(urlString: self.urlString, decodeType: .all, completion: completion)
    }
    
    func fetchRandomPersons(completion: @escaping ([Person]?) -> Void) {
        fetchRandom(url: self.urlString, count: 671, decodeType: .random, completion: completion)
    }
    
    func fetchPerson(id: Int, completion: @escaping (Person?) -> Void) {
        let urlString = urlString + "/" + String(id)
        NetworkService.fetchData(urlString: urlString, decodeType: .person, completion: completion)
    }
    
    func fetchCurrentPerson(url: String, completion: @escaping (Person?) -> Void) {
        NetworkService.fetchData(urlString: urlString, decodeType: .person, completion: completion)
    }
    
    //MARK: Location
    
    func fetchRandomLocations(completion: @escaping ([Location]?) -> Void) {
        fetchRandom(url: self.urlStringLocation, count: 108, decodeType: .randomLocations, completion: completion)
    }
    
    func fetchLocation(id: Int, completion: @escaping (Location?) -> Void) {
        let url = urlStringLocation + "/" + String(id)
        NetworkService.fetchData(urlString: url, decodeType: .location, completion: completion)
    }
    
    func fetchCurrentLocation(url: String, completion: @escaping (Location?) -> Void) {

        NetworkService.fetchData(urlString: url, decodeType: .location, completion: completion)
    }
    
    //MARK: Random
    
    func fetchRandom<T>(url: String, count: Int, decodeType: DecodeType, completion: @escaping ([T]?) -> Void) {
        var urlString = ""
        
        for _ in 0..<8 {
            let randomInt = Int.random(in: 0..<count)
            
            if urlString == "" {
                urlString = url + "/" + String(randomInt)
            } else {
                urlString += ",\(randomInt)"
            }
        }
        NetworkService.fetchData(urlString: urlString, decodeType: decodeType, completion: completion)
    }
}
