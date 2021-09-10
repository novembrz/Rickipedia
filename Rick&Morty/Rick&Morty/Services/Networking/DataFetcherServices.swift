//
//  DataFetcherServices.swift
//  Rick&Morty
//
//  Created by dasha on 07.09.2021.
//

import Foundation
import SwiftUI

struct DataFetcherServices {
    
    static var allPersonsURL = "https://rickandmortyapi.com/api/character"
    static var locationURL = "https://rickandmortyapi.com/api/location"
    
    
    //MARK: - Perons
    static func fetchAllPersons(completion: @escaping (RickMortyModel?) -> Void){
        NetworkManager.fetchData(urlString: allPersonsURL, completion: completion)
    }
    
    static func fetchRandomPersons(completion: @escaping ([PersonModel]?) -> Void) {
        fetchRandom(url: allPersonsURL, count: 671, completion: completion)
    }
    
    //конкретные персонажи
    static func fetchResidents(urlString: String, completion: @escaping ([PersonModel]?) -> Void) {
        NetworkManager.fetchData(urlString: urlString, completion: completion)
    }
    
    //персонаж по id
    static func fetchPerson(id: Int, completion: @escaping (PersonModel?) -> Void) {
        let urlString = "\(allPersonsURL)/\(id)"
        NetworkManager.fetchData(urlString: urlString, completion: completion)
    }
    
    //персонаж по url
    static func fetchURLPerson(urlString: String, completion: @escaping (PersonModel?) -> Void) {
        NetworkManager.fetchData(urlString: urlString, completion: completion)
    }
    
    
    //MARK: - Location
    static func fetchLocation(urlString: String, completion: @escaping (LocationModel?) -> Void) {
        NetworkManager.fetchData(urlString: urlString, completion: completion)
    }
    
    //много рандомных
    static func fetchRandomLocations(completion: @escaping ([LocationModel]?) -> Void) {
        fetchRandom(url: locationURL, count: 108, completion: completion)
    }
    
    
    //MARK: - Episodes
    static func fetchEpisodes(urlString: String, completion: @escaping ([EpisodeModel]?) -> Void) {
        NetworkManager.fetchData(urlString: urlString, completion: completion)
    }
    
    static func fetchEpisode(urlString: String, completion: @escaping (EpisodeModel?) -> Void) {
        NetworkManager.fetchData(urlString: urlString, completion: completion)
    }
    
    
    //MARK: - Random
    
    static private func fetchRandom<T: Decodable>(url: String, count: Int, completion: @escaping ([T]?) -> Void) {
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
        
        NetworkManager.fetchData(urlString: urlString, completion: completion)
    }
}
