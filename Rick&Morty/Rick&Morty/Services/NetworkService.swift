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
                let decoded = decodeAllJSON(type: T.self, from: data)
                completion(decoded)
            case .random:
                let decoded = decodeRandomJSON(type: T.self, from: data)
                completion(decoded)
            }
        }
        task.resume()
    }
    
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
}

