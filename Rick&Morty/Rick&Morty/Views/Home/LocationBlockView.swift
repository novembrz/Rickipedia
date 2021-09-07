//
//  LocationBlockView.swift
//  Rick&Morty
//
//  Created by dasha on 26.06.2021.
//

import SwiftUI

final class LocationBlockViewModel: ObservableObject {
    
    @Published var locations: [Location] = []
    @Published var location: Location?
    @Published var url: String?
    
    func getLocations() {
        DataFetcher().fetchRandomLocations { [self] result in
            DispatchQueue.main.async {
                guard let locations = result else {return}
                self.locations = locations
            }
        }
    }
}

struct LocationBlockView: View {
    
    @StateObject var viewModel = LocationBlockViewModel()
    @State var isPresented = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Locations")
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 18) {
                    ForEach(viewModel.locations, id: \.self) { location in
                        //if location.name != "unknow" {
                            Button {
                                viewModel.url = location.url
                                isPresented.toggle()
                            } label: {
                                VStack(alignment: .leading, spacing: 8) {
                                    Image(imageExists(imageName: location.name) ? location.name : "DarkLocation")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 151, height: 81)
                                        .cornerRadius(10)
                                    
                                    Text(location.name)
                                        .multilineTextAlignment(.leading)
                                        .font(.system(size: 20, weight: .medium))
                                        .frame(maxWidth: 151)
                                        .lineLimit(2)
                                }
                            }
                            .sheet(isPresented: $isPresented) {
                                LocationEpisodeCardView(url: $viewModel.url, type: .location)
                            }
                        //}
                    }
                }
            }
        }
        .padding(.bottom, 20)
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
