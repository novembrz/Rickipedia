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
        var persons: [Person] = []
        
        guard let data = from else { return nil }
        guard let json = try? JSON(data: data, options: JSONSerialization.ReadingOptions.mutableContainers) else {return nil}
        
        let arrayNames = json["results"].arrayValue
        
        for i in 0..<7 {
            let name = arrayNames[i]["name"].stringValue
            let id = arrayNames[i]["id"].intValue
            let image = arrayNames[i]["image"].stringValue
            
            persons.append(Person(index: i, name: name, id: id, image: image))
        }
        
        return persons as? T
    }
    
    static func decodeRandomJSON<T>(type: T.Type, from: Data?) -> T? {
        var persons: [Person] = []
        
        guard let data = from else { return nil }
        guard let json = try? JSON(data: data, options: JSONSerialization.ReadingOptions.mutableContainers) else {return nil}
        
        let arrayNames = json.arrayValue
        
        for i in 0..<5 {
            let name = arrayNames[i]["name"].stringValue
            let id = arrayNames[i]["id"].intValue
            let image = arrayNames[i]["image"].stringValue
            
            persons.append(Person(index: i, name: name, id: id, image: image))
        }
        
        return persons as? T
    }
}
