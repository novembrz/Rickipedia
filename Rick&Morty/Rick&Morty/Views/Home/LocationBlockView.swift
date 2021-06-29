//
//  LocationBlockView.swift
//  Rick&Morty
//
//  Created by dasha on 26.06.2021.
//

import SwiftUI

final class LocationBlockViewModel: ObservableObject {
    
    @Published var locations: [Location] = []
    
    func getLocations() {
        DataFetcherServices().fetchRandomLocations { [self] result in
            DispatchQueue.main.async {
                guard let locations = result else {return}
                self.locations = locations
            }
        }
    }
}

struct LocationBlockView: View {
    
    @ObservedObject var viewModel = LocationBlockViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Locations")
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 18) {
                    
                    ForEach(viewModel.locations, id: \.self) { location in
                        VStack(alignment: .leading, spacing: 8) {
                            Image(imageExists(imageName: location.name) ? location.name : "DarkLocation")
                                .resizable()
                                .frame(width: 151, height: 81)
                                .scaledToFit()
                                .cornerRadius(10)
                            
                            Text(location.name)
                                .multilineTextAlignment(.leading)
                                .font(.system(size: 20, weight: .medium))
                                .frame(maxWidth: 151)
                                .lineLimit(2)
                        }
                    }
                }
            }
        }
        .onAppear() {
            viewModel.getLocations()
        }
    }
}

struct LocationBlockView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarRouterView(viewRouter: Router())
    }
}
