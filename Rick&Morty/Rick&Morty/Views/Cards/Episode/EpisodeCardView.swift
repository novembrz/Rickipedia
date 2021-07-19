//
//  EpisodeCardView.swift
//  Rick&Morty
//
//  Created by dasha on 15.07.2021.
//

import SwiftUI

final class EpisodeCardViewModel: ObservableObject {
    
    @Published var episodes: [Episode]?
    
    func getEpisodes(url: String, count: Int) {
        DataFetcherServices().fetchEpisodes(url: url, count: count) { result in
            DispatchQueue.main.async {
                guard let episodes = result else {return}
                self.episodes = episodes
            }
        }
    }
}

struct EpisodeCardView: View {
    
    @StateObject var viewModel = EpisodeCardViewModel()
//    var urls: String = "https://rickandmortyapi.com/api/episode/1,2,3,4,5,6"
//    var count: Int = 6
    @Binding var urls: String
    @Binding var count: Int
    
    var body: some View {
        VStack(spacing: 15) {
            HeaderButtonsView(needFav: false)
            
            VStack(alignment: .leading, spacing: 35) {
                Text("episodes".uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 15) {
                        ForEach(viewModel.episodes ?? [AppData.episode], id: \.self) { episode in
                            HStack {
                                Text(episode.name)
                                    .font(.system(size: 18, weight: .medium))
                                    .lineLimit(2)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: 225, alignment: .leading)
                                    .padding(.horizontal)
                                    .padding(.vertical, 21)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color("GrayElementColor"))
                        .cornerRadius(11)
                    }
                }
            }
        }
        .foregroundColor(.white)
        .padding()
        .background(Color("GrayBgColor"))
        .edgesIgnoringSafeArea(.all)
        .onAppear() { viewModel.getEpisodes(url: urls, count: count) }
    }
}

//struct EpisodeCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        EpisodeCardView()
//    }
//}
