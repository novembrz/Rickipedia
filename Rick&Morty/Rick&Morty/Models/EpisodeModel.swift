//
//  Episode.swift
//  Rick&Morty
//
//  Created by dasha on 09.09.2021.
//

import Foundation

struct EpisodeModel: Decodable {
    let id: Int
    let name: String
    let airDate: String //"air_date"
    let episode: String
    let url: String
    let characters: [String]
    
    enum CodingKeys: String, CodingKey {
        case id, name, episode, characters, url
        case airDate = "air_date"
    }
}

extension EpisodeModel: Hashable {
    static func == (lhs: EpisodeModel, rhs: EpisodeModel) -> Bool {
        return lhs.id == rhs.id
    }
}
