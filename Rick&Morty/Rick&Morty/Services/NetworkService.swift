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
    case person
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
                let persons = appendPersons(from: json["results"].arrayValue, count: 20)
                completion(persons as? T)
            case .random:
                let persons = appendPersons(from: json.arrayValue, count: 5)
                completion(persons as? T)
            case .person:
                let person = appendOnePerson(from: json)
                completion(person as? T)
            }
        }
        task.resume()
    }
    
    //MARK: Decode
    static func appendPersons(from json: [JSON], count: Int) -> [Person] {
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
    
    static func appendOnePerson(from json: JSON) -> Person {
        let name = json["name"].stringValue
        let id = json["id"].intValue
        let image = json["image"].stringValue
        let species = json["species"].stringValue //раса
        let gender = json["gender"].stringValue
        let status = json["status"].stringValue
        let type = json["type"].stringValue
        let url = json["url"].stringValue
        
        let person = Person(index: 0, id: id, name: name, image: image, status: status, species: species, type: type, gender: gender, url: url)
        return person
    }
}

