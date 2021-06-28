//
//  NetworkParser.swift
//  Rick&Morty
//
//  Created by dasha on 27.06.2021.
//

import Foundation
import SwiftyJSON

final class NetworkParser {
    
    //MARK: Decode Persons
    static func appendPersons(from json: [JSON], count: Int) -> [Person] {
        var persons: [Person] = []
        for i in 0..<count-1 {
            let name = json[i]["name"].stringValue
            let id = json[i]["id"].intValue
            let image = json[i]["image"].stringValue
            let species = json[i]["species"].stringValue //раса
            let gender = json[i]["gender"].stringValue
            let status = json[i]["status"].stringValue
            let type = json[i]["type"].stringValue
            let url = json[i]["url"].stringValue
            let episode: [String] = json[i]["episode"].arrayValue.map { $0.stringValue}
            
            var origin: PersonOrigin? = PersonOrigin(name: "", url: "")
            var location: PersonLocation? = PersonLocation(name: "", url: "")
            
            if let originUrl = json[i]["origin"]["url"].string, let originName = json[i]["origin"]["name"].string{
                origin = PersonOrigin(name: originName, url: originUrl)
            }
            if let locationUrl = json[i]["location"]["url"].string, let locationName = json[i]["location"]["name"].string{
                location = PersonLocation(name: locationName, url: locationUrl)
            }
            persons.append(Person(index: i, id: id, name: name, image: image, status: status, species: species, type: type, gender: gender, url: url, origin: origin, location: location, episode: episode))
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
        let episode: [String] = json["episode"].arrayValue.map { $0.stringValue}
        
        var origin: PersonOrigin? = PersonOrigin(name: "", url: "")
        var location: PersonLocation? = PersonLocation(name: "", url: "")
        
        if let originUrl = json["origin"]["url"].string, let originName = json["origin"]["name"].string{
            origin = PersonOrigin(name: originName, url: originUrl)
        }
        if let locationUrl = json["location"]["url"].string, let locationName = json["location"]["name"].string{
            location = PersonLocation(name: locationName, url: locationUrl)
        }
        
        let person = Person(index: 0, id: id, name: name, image: image, status: status, species: species, type: type, gender: gender, url: url, origin: origin, location: location, episode: episode)
        return person
    }
    
    //MARK: Decode Locations
    static func appendLocations(from json: [JSON], count: Int) -> [Location] {
        var locations: [Location] = []
        for i in 0..<count-1 {
            let name = json[i]["name"].stringValue
            let id = json[i]["id"].intValue
            let type = json[i]["type"].stringValue
            let dimension = json[i]["dimension"].stringValue
            let url = json[i]["url"].stringValue
            let residents: [String] = json[i]["residents"].arrayValue.map { $0.stringValue}

            locations.append(Location(id: id, name: name, type: type, dimension: dimension, url: url, residents: residents))
        }
        return locations
    }
    
    static func appendOneLocation(from json: JSON) -> Location {
        let id = json["id"].intValue
        let name = json["name"].stringValue
        let type = json["type"].stringValue
        let dimension = json["dimension"].stringValue
        let url = json["url"].stringValue
        let residents: [String] = json["residents"].arrayValue.map { $0.stringValue}
        
        let location = Location(id: id, name: name, type: type, dimension: dimension, url: url, residents: residents)
        return location
    }
}
