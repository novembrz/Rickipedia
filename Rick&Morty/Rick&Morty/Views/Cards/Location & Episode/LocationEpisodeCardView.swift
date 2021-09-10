//
//  LocCardView.swift
//  Rick&Morty
//
//  Created by dasha on 06.07.2021.
//

import SwiftUI
import Kingfisher

//MARK: ViewModel

final class LocationEpisodeCardViewModel: ObservableObject {
    @Published var resurse: LocationModel?
    
    @Published var residents: [String]?
    @Published var isLoading = false
    
    func getLocation(url: String?, type: CardType) {
        switch type {
        case .location:
            DataFetcherServices.fetchLocation(urlString: url ?? "") { result in
                DispatchQueue.main.async {
                    guard let location = result else {return}
                    self.resurse = location
                    self.residents = location.residents
                }
            }
        case .episode:
            DataFetcherServices.fetchEpisode(urlString: url ?? "") { result in
                DispatchQueue.main.async {
                    guard let episode = result else {return}
                    self.resurse = LocationModel(name: episode.name, url: episode.url, id: episode.id, type: episode.airDate, dimension: episode.episode, residents: episode.characters)
                    self.residents = episode.characters
                }
            }
        }
    }
}

//MARK: Enum
enum CardType {
    case location, episode
}

//MARK: View

struct LocationEpisodeCardView: View {
    
    @StateObject var viewModel = LocationEpisodeCardViewModel()
    @Binding var url: String?
    @State var type: CardType
    //var url: String = "https://rickandmortyapi.com/api/location/13"
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var body: some View {
        VStack(alignment: .leading) {
            if let resurse = viewModel.resurse, let dimension = resurse.dimension, let type = resurse.type {
                ZStack(alignment: .top) {
                    
                    Image(imageExists(imageName: resurse.name) ? resurse.name : "DarkLocation")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: width, height: height / 4 * 3)
                    
                    Image("topLinerGradient")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: width, height: height / 4 * 3)
                    
                    VStack {
                        VStack(alignment: .leading) {
                            HeaderButtonsView(needFav: true)
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text(resurse.name)
                                    .font(.system(size: 35, weight: .bold))
                                
                                Text("\(dimension) / \(type)")
                                    .font(.system(size: 18, weight: .medium))
                            }
                            .padding()
                        }
                        
                        Spacer()
                        
                        ResidentsCardView(residents: viewModel.residents ?? [""])
                    }
                }
            }
        }
        .foregroundColor(.white)
        .background(Color("GrayElementColor"))
        .ignoresSafeArea()
        .onAppear() { viewModel.getLocation(url: url, type: type) }
    }
}

//MARK: - Previews
//struct LocationCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        LocationCardView(viewModel: LocationCardViewModel())
//    }
//}
