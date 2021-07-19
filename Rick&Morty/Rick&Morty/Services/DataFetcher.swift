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
    
    //MARK: - Person
    //все персонажи, по 20 каждый запрос
    func fetchAllPersons(completion: @escaping ([Person]?) -> Void) {
        NetworkService.fetchData(urlString: self.urlString, count: nil, decodeType: .persons, completion: completion)
    }
    
    //рандомные песроны, в юрл указываешь id тех кто нужен
    func fetchRandomPersons(completion: @escaping ([Person]?) -> Void) {
        fetchRandom(url: self.urlString, count: 671, decodeType: .random, completion: completion)
    }
    
    //конкретные персонажи
    func fetchResidents(url: String, count: Int, completion: @escaping ([Person]?) -> Void) {
        NetworkService.fetchData(urlString: url, count: count, decodeType: .persons, completion: completion)
    }
    
    //персонаж по id
    func fetchPerson(id: Int, completion: @escaping ([Person]?) -> Void) {
        let urlString = urlString + "/" + String(id)
        NetworkService.fetchData(urlString: urlString, count: 1, decodeType: .persons, completion: completion)
    }
    
    //персонаж по url
    func fetchCurrentPerson(url: String, completion: @escaping ([Person]?) -> Void) {
        NetworkService.fetchData(urlString: urlString, count: 1, decodeType: .persons, completion: completion)
    }
    
    //MARK: - Location
    //много рандомных
    func fetchRandomLocations(completion: @escaping ([Location]?) -> Void) {
        fetchRandom(url: self.urlStringLocation, count: 108, decodeType: .locations, completion: completion)
    }
    
    //одна локация
    func fetchLocation(url: String, completion: @escaping ([Location]?) -> Void) {
        NetworkService.fetchData(urlString: url, count: 1, decodeType: .locations, completion: completion)
    }
    
    //MARK: - Episode
    
    func fetchEpisodes(url: String, count: Int, completion: @escaping ([Episode]?) -> Void) {
        NetworkService.fetchData(urlString: url, count: count, decodeType: .episodes, completion: completion)
    }
    
    //MARK: - Random
    
    func fetchRandom<T>(url: String, count: Int, decodeType: DecodeType, completion: @escaping ([T]?) -> Void) {
        var urlString = ""
        var countIter = 0
        
        for _ in 0..<8 {
            let randomInt = Int.random(in: 0...count)
            countIter += 1
            if urlString == "" {
                urlString = url + "/" + String(randomInt)
            } else {
                urlString += ",\(randomInt)"
            }
        }
        NetworkService.fetchData(urlString: urlString, count: countIter, decodeType: decodeType, completion: completion)
    }
}
