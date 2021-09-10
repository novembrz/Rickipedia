//
//  PersonLocationView.swift
//  Rick&Morty
//
//  Created by dasha on 18.06.2021.
//

import SwiftUI

//MARK: View
struct PersonLocationView: View {
    var origin: LocationModel?
    var location: LocationModel?
    
    let columns: [GridItem] = Array(repeating: .init(.flexible(maximum: UIScreen.main.bounds.width / 2), spacing: 20, alignment: .topLeading), count: 2)
    
    var body: some View {
        
        if origin?.name != nil || location?.name != nil {
            VStack(alignment: .leading, spacing: 21) {
                Text("Locations")
                    .font(.system(size: 30, weight: .bold))
                
                LazyVGrid(columns: columns) {
                    if origin != nil, origin?.name != "unknown", let name = origin?.name, let url = origin?.url {
                        PersonLocationViewItem(url: url, type: "Origin", locationName: name)
                    }
                    
                    if location != nil, location?.name != "unknown", let name = location?.name, let url = location?.url {
                        PersonLocationViewItem(url: url, type: "Last location", locationName: name)
                    }
                }
            }
        }
    }
}

//MARK: Item

class PersonLocationViewModelItem: ObservableObject {
    @Published var url: String?
    @Published var showCard = false
}

struct PersonLocationViewItem: View {
    @StateObject var viewModel = PersonLocationViewModelItem()
    
    var url: String
    var type: String
    var locationName: String
    
    var body: some View {
        Button {
            viewModel.showCard = true
            viewModel.url = url
        } label: {
            VStack(alignment: .leading, spacing: 10) {
                Image(imageExists(imageName: locationName) ? locationName : "DarkLocation")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 81)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(10)
                VStack(alignment: .leading, spacing: 2) {
                    Text(type)
                        .font(.system(size: 20, weight: .medium))
                    Text(locationName)
                        .font(.system(size: 16, weight: .regular))
                        .lineLimit(1)
                }
            }
        }
        .sheet(isPresented: $viewModel.showCard) {
            LocationEpisodeCardView(viewModel: LocationEpisodeCardViewModel(), url: $viewModel.url, type: .location)
        }
    }
}
