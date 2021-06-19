//
//  PersonLocationView.swift
//  Rick&Morty
//
//  Created by dasha on 18.06.2021.
//

import SwiftUI

//MARK: View
struct PersonLocationView: View {
    
    var person: Person
    var columns: [GridItem] = Array(repeating: .init(.flexible(maximum: UIScreen.main.bounds.width / 2), spacing: 20, alignment: .topLeading), count: 2)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 21) {
            Text("Locations")
                .font(.system(size: 30, weight: .bold))
            
            LazyVGrid(columns: columns) {
                PersonLocationViewItem(image: "DarkLocation", name: "Origin", desc: "person.origin")
                PersonLocationViewItem(image: "LightLocation", name: "Last location", desc: "person.location")
            }
        }
    }
}

//MARK: Item
struct PersonLocationViewItem: View {
    var image: String
    var name: String
    var desc: String
    
    var body: some View {
        Button {
            // TODO: Routing to LocationViewController
        } label: {
            VStack(alignment: .leading, spacing: 10) {
                Image(image)
                    .resizable()
                    .frame(height: 81)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(10)
                VStack(alignment: .leading, spacing: 2) {
                    Text(name)
                        .font(.system(size: 20, weight: .medium))
                    Text(desc)
                        .font(.system(size: 16, weight: .regular))
                }
            }
        }
    }
}
