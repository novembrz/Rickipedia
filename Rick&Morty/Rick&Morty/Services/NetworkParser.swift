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
    static func appendPersons<T>(from json: T?, count: Int) -> [Person] {
        var persons: [Person] = []
        
        if count == 1 {
            guard let json = json as? JSON else { return [AppData.person] }
            
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
            
            persons.append(Person(index: 0, id: id, name: name, image: image, status: status, species: species, type: type, gender: gender, url: url, origin: origin, location: location, episode: episode))
        } else {
            for i in 0..<count {
                guard let json = json as? [JSON] else { return [AppData.person] }
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
        }
        return persons
    }
    
    //MARK: Decode Locations
    static func appendLocations<T>(from json: T?, count: Int) -> [Location] {
        var locations: [Location] = []
        if count == 1 {
            guard let json = json as? JSON else { return [AppData.location] }
            let id = json["id"].intValue
            let name = json["name"].stringValue
            let type = json["type"].stringValue
            let dimension = json["dimension"].stringValue
            let url = json["url"].stringValue
            let residents: [String] = json["residents"].arrayValue.map { $0.stringValue}
            
            locations.append(Location(id: id, name: name, type: type, dimension: dimension, url: url, residents: residents))
        } else {
            for i in 0..<count {
                guard let json = json as? [JSON] else { return [AppData.location] }
                let name = json[i]["name"].stringValue
                let id = json[i]["id"].intValue
                let type = json[i]["type"].stringValue
                let dimension = json[i]["dimension"].stringValue
                let url = json[i]["url"].stringValue
                let residents: [String] = json[i]["residents"].arrayValue.map { $0.stringValue}
                
                locations.append(Location(id: id, name: name, type: type, dimension: dimension, url: url, residents: residents))
            }
        }
        return locations
    }
    
    //MARK: Decode Episodes
    
    static func appendEpisodes<T>(from json: T?, count: Int) -> [Episode] {
        var episodes: [Episode] = []

        if count == 1 {
            guard let json = json as? JSON else { return [AppData.episode]}
            let name = json["name"].stringValue
            let id = json["id"].intValue
            let date = json["air_date"].stringValue
            let episode = json["episode"].stringValue
            let url = json["url"].stringValue
            let characters: [String] = json["characters"].arrayValue.map { $0.stringValue}
            
            episodes.append(Episode(id: id, name: name, date: date, episode: episode, url: url, characters: characters))
            
        } else {
            for i in 0..<count {
                guard let json = json as? [JSON] else { return [AppData.episode] }
                let name = json[i]["name"].stringValue
                let id = json[i]["id"].intValue
                let date = json[i]["air_date"].stringValue
                let episode = json[i]["episode"].stringValue
                let url = json[i]["url"].stringValue
                let characters: [String] = json[i]["characters"].arrayValue.map { $0.stringValue}
                
                episodes.append(Episode(id: id, name: name, date: date, episode: episode, url: url, characters: characters))
            }
        }
        
        return episodes
    }
    
    
}
