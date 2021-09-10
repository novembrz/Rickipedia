//
//  AppData.swift
//  Rick&Morty
//
//  Created by dasha on 18.07.2021.
//

import Foundation

struct AppData {
    
    static var defaultImageUrl = "https://pristor.ru/wp-content/uploads/2018/11/%D0%A0%D0%B8%D0%BA-%D0%B8-%D0%9C%D0%BE%D1%80%D1%82%D0%B8-%D0%BA%D0%BB%D0%B0%D1%81%D1%81%D0%BD%D1%8B%D0%B5-%D0%B8-%D0%BA%D1%80%D1%83%D1%82%D1%8B%D0%B5-%D0%BA%D0%B0%D1%80%D1%82%D0%B8%D0%BD%D0%BA%D0%B8-%D0%BD%D0%B0-%D0%B0%D0%B2%D1%83-%D0%B8-%D0%BD%D0%B0-%D0%B7%D0%B0%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D1%83-19-576x1024.jpg"
    
    static let personModel = PersonModel(id: 0, name: "", image: "", status: "", species: "", type: "", gender: "", url: "", origin: LocationModel(name: "", url: "", id: 0, type: "", dimension: "", residents: []), location: LocationModel(name: "", url: "", id: 0, type: "", dimension: "", residents: []), episode: [])
    static let episodeModel = EpisodeModel(id: 0, name: "", airDate: "", episode: "", url: "", characters: [])
}
