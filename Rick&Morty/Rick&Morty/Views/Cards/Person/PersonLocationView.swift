//
//  PersonLocationView.swift
//  Rick&Morty
//
//  Created by dasha on 18.06.2021.
//

import SwiftUI

//MARK: View
struct PersonLocationView: View {
    var origin: Location?
    var location: Location?
    
    let columns: [GridItem] = Array(repeating: .init(.flexible(maximum: UIScreen.main.bounds.width / 2), spacing: 20, alignment: .topLeading), count: 2)
    
    var body: some View {
        
        if origin?.name != "unknown" && location?.name != "unknown" {
            VStack(alignment: .leading, spacing: 21) {
                Text("Locations")
                    .font(.system(size: 30, weight: .bold))
                
                LazyVGrid(columns: columns) {
                    if origin != nil, origin?.name != "unknown", let name = origin?.name, let url = origin?.url {
                        PersonLocationViewItem(image: "DarkLocation", name: "Origin", desc: name, url: url)
                    }
                    
                    if location != nil, location?.name != "unknown", let name = location?.name, let url = location?.url {
                        PersonLocationViewItem(image: "LightLocation", name: "Last location", desc: name, url: url)
                    }
                }
            }
        }
    }
}

//MARK: Item
struct PersonLocationViewItem: View {
    var image: String
    var name: String
    var desc: String
    var url: String
    
    var body: some View {
        Button {
            // TODO: Routing to LocationViewController
        } label: {
            VStack(alignment: .leading, spacing: 10) {
                Image(imageExists(imageName: desc) ? desc : "DarkLocation")
                    .resizable()
                    .frame(height: 81)
                    .frame(maxWidth: .infinity)
                    .scaledToFit()
                    .cornerRadius(10)
                VStack(alignment: .leading, spacing: 2) {
                    Text(name)
                        .font(.system(size: 20, weight: .medium))
                    Text(desc)
                        .font(.system(size: 16, weight: .regular))
                        .lineLimit(1)
                }
            }
        }
    }
}
