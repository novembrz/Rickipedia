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
<<<<<<< HEAD
    case randomLocations
    case person
    case location
=======
>>>>>>> parent of fa54670 (Refactored the NetworkService)
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
            
            switch decodeType {
            case .all:
<<<<<<< HEAD
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
=======
                let decoded = decodeAllJSON(type: T.self, from: data)
                completion(decoded)
            case .random:
                let decoded = decodeRandomJSON(type: T.self, from: data)
                completion(decoded)
>>>>>>> parent of fa54670 (Refactored the NetworkService)
            }
        }
        task.resume()
    }
<<<<<<< HEAD
=======
    
    //MARK: Decode
    
    static func decodeAllJSON<T>(type: T.Type, from: Data?) -> T? {
        guard let data = from else { return nil }
        guard let json = try? JSON(data: data, options: JSONSerialization.ReadingOptions.mutableContainers) else {return nil}
        let persons = personsAppend(from: json["results"].arrayValue, count: 20)
        
        return persons as? T
    }
    
    static func decodeRandomJSON<T>(type: T.Type, from: Data?) -> T? {
        guard let data = from else { return nil }
        guard let json = try? JSON(data: data, options: JSONSerialization.ReadingOptions.mutableContainers) else {return nil}
        let persons = personsAppend(from: json.arrayValue, count: 5)
        
        return persons as? T
    }
    
    static func personsAppend(from json: [JSON], count: Int) -> [Person] {
        var persons: [Person] = []
        for i in 0..<count {
            let name = json[i]["name"].stringValue
            let id = json[i]["id"].intValue
            let image = json[i]["image"].stringValue
            let species = json[i]["species"].stringValue //раса
            let gender = json[i]["gender"].stringValue
            let status = json[i]["status"].stringValue
            let type = json[i]["type"].stringValue
            let url = json[i]["url"].stringValue
            //let episode = arrayNames[i]["episode"].arrayValue
            //let origin = arrayNames[i]["origin"].dictionaryValue
            //let location = arrayNames[i]["location"].dictionaryValue
            
            persons.append(Person(index: i, id: id, name: name, image: image, status: status, species: species, type: type, gender: gender, url: url))
        }
        return persons
    }
>>>>>>> parent of fa54670 (Refactored the NetworkService)
}


