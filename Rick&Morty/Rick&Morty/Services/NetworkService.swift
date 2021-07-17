//
//  NetworkService.swift
//  Rick&Morty
//
//  Created by dasha on 25.05.2021.
//

import Foundation
import SwiftyJSON

enum DecodeType {
    case persons
    case random
    case locations
    case episodes
}

struct NetworkService {
    
    static func fetchData<T>(urlString: String, count: Int?, decodeType: DecodeType, completion: @escaping (T?) -> Void) {
        
        guard let url = URL(string: urlString) else {return}
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {//, let response = response else {
                if let error = error {
                    print("💔Error get data", error.localizedDescription)
                }
                return
            }
            //print("💡Network responce", response)
            
            guard let json = try? JSON(data: data, options: JSONSerialization.ReadingOptions.mutableContainers) else {return}
            
            switch decodeType {
            case .random: //остается
                let persons = NetworkParser.appendPersons(from: json.arrayValue, count: count!)
                completion(persons as? T)
            case .persons:
                if count == nil {
                    let persons = NetworkParser.appendPersons(from: json["results"].arrayValue, count: 20)
                    completion(persons as? T)
                } else if count == 1 {
                    let person = NetworkParser.appendPersons(from: json, count: count!)
                    completion(person as? T)
                } else {
                    let persons = NetworkParser.appendPersons(from: json.arrayValue, count: count!)
                    completion(persons as? T)
                }
            case .locations:
                if count == 1 {
                    let location = NetworkParser.appendLocations(from: json, count: count!)
                    completion(location as? T)
                } else {
                    let locations = NetworkParser.appendLocations(from: json.arrayValue, count: 8)
                    completion(locations as? T)
                }
            case .episodes:
                if count == 1 {
                    let episodes = NetworkParser.appendEpisodes(from: json, count: count!)
                    completion(episodes as? T)
                } else {
                    let episodes = NetworkParser.appendEpisodes(from: json.arrayValue, count: count!)
                    completion(episodes as? T)
                }
            }
        }
        task.resume()
    }
}


