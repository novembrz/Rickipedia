//
//  DataFetcher.swift
//  Rick&Morty
//
//  Created by dasha on 25.05.2021.
//

import Foundation

struct DataFetcherServices {
    
<<<<<<< HEAD
    private var urlString = "https://rickandmortyapi.com/api/character"
    private var urlStringLocation = "https://rickandmortyapi.com/api/location"
    private var urlStringEpisode = "https://rickandmortyapi.com/api/episode"
    
    //MARK: Person
    //все персонажи, по 20 каждый запрос
    func fetchAllPersons(completion: @escaping ([Person]?) -> Void) {
        NetworkService.fetchData(urlString: self.urlString, count: nil, decodeType: .all, completion: completion)
    }
    
    //рандомные песроны, в юрл указываешь id тех кто нужен
    func fetchRandomPersons(completion: @escaping ([Person]?) -> Void) {
        fetchRandom(url: self.urlString, count: 671, decodeType: .random, completion: completion)
    }
    
    //конкретные персонажи
    func fetchResidents(url: String, count: Int, completion: @escaping ([Person]?) -> Void) {
        NetworkService.fetchData(urlString: url, count: count, decodeType: .residents, completion: completion)
    }
    
    //персонаж по id
    func fetchPerson(id: Int, completion: @escaping (Person?) -> Void) {
        let urlString = urlString + "/" + String(id)
        NetworkService.fetchData(urlString: urlString, count: nil, decodeType: .person, completion: completion)
    }
    
    //персонаж по url
    func fetchCurrentPerson(url: String, completion: @escaping (Person?) -> Void) {
        NetworkService.fetchData(urlString: urlString, count: nil, decodeType: .person, completion: completion)
    }
    
    //MARK: Location
    
    func fetchRandomLocations(completion: @escaping ([Location]?) -> Void) {
        fetchRandom(url: self.urlStringLocation, count: 108, decodeType: .randomLocations, completion: completion)
    }
    
    func fetchLocation(id: Int, completion: @escaping (Location?) -> Void) {
        let url = urlStringLocation + "/" + String(id)
        NetworkService.fetchData(urlString: url, count: nil, decodeType: .location, completion: completion)
    }
    
    func fetchCurrentLocation(url: String, completion: @escaping (Location?) -> Void) {

        NetworkService.fetchData(urlString: url, count: nil, decodeType: .location, completion: completion)
    }
    
    //MARK: Random
    
    func fetchRandom<T>(url: String, count: Int, decodeType: DecodeType, completion: @escaping ([T]?) -> Void) {
=======
    static func fetchAllPersons(completion: @escaping ([Person]?) -> Void) {
        let urlString = "https://rickandmortyapi.com/api/character"
        NetworkService.fetchData(urlString: urlString, decodeType: .all, completion: completion)
    }
    
    static func fetchRandomPersons(completion: @escaping ([Person]?) -> Void) {

>>>>>>> parent of fa54670 (Refactored the NetworkService)
        var urlString = ""
        
        for _ in 0..<8 {
            let randomInt = Int.random(in: 0..<count)
            
            if urlString == "" {
<<<<<<< HEAD
                urlString = url + "/" + String(randomInt)
=======
                urlString = "https://rickandmortyapi.com/api/character/\(randomInt)"
>>>>>>> parent of fa54670 (Refactored the NetworkService)
            } else {
                urlString += ",\(randomInt)"
            }
        }
        NetworkService.fetchData(urlString: urlString, count: nil, decodeType: decodeType, completion: completion)
    }
}
