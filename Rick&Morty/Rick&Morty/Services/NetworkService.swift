//
//  NetworkService.swift
//  Rick&Morty
//
//  Created by dasha on 25.05.2021.
//

import Foundation
import SwiftyJSON

enum DecodeType {
    case all
    case random
    case randomLocations
    case person
    case location
}

struct NetworkService {
    
    static func fetchData<T>(urlString: String, decodeType: DecodeType, completion: @escaping (T?) -> Void) {
        
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
            case .all:
                let persons = NetworkParser.appendPersons(from: json["results"].arrayValue, count: 20)
                completion(persons as? T)
            case .random:
                let persons = NetworkParser.appendPersons(from: json.arrayValue, count: 8)
                completion(persons as? T)
            case .randomLocations:
                let locations = NetworkParser.appendLocations(from: json.arrayValue, count: 8)
                completion(locations as? T)
            case .person:
                let person = NetworkParser.appendOnePerson(from: json)
                completion(person as? T)
            case .location:
                let location = NetworkParser.appendOneLocation(from: json)
                completion(location as? T)
            }
        }
        task.resume()
    }
}


