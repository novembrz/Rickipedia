//
//  FavPersons.swift
//  Rick&Morty
//
//  Created by dasha on 13.09.2021.
//

import Foundation


struct WidgetProvider {
    
    static var myPerson = WidgetModel(name: "Defiance Beth", imageName: "Defiance Beth", info: "Clone | Earth(C-137)")
    
    static var personsList: [WidgetModel] = [
        WidgetModel(name: "Teddy Rick", imageName: "Teddy Rick", info: "Teddy Bear | Earth(Bears Dimension)"),
        WidgetModel(name: "Roy", imageName: "Roy", info: "Human | Roy's Machine"),
        WidgetModel(name: "Richy Rick", imageName: "Richy Rick", info: "Human | Citadel of Rics"),
        WidgetModel(name: "Defiance Beth", imageName: "Defiance Beth", info: "Clone | Earth(C-137)"),
        WidgetModel(name: "Journalist Rick", imageName: "Journalist Rick", info: "Human | Citadel of Rics"),
        WidgetModel(name: "Dr. Occolopus", imageName: "Dr. Occolopus", info: "Tenatacle | Space Hospital"),
        WidgetModel(name: "Greasy Morty", imageName: "Greasy Morty", info: "Human | Citadel of Rics")
    ]
}

struct WidgetModel: Codable {
    var name: String
    var imageName: String
    var info: String
}
