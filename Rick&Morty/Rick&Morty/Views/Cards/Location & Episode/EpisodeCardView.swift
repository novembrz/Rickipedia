//
//  EpisodeCardView.swift
//  Rick&Morty
//
//  Created by dasha on 15.07.2021.
//

import SwiftUI

final class EpisodeCardViewModel: ObservableObject {
    
    @Published var episodes: [EpisodeModel]?
    @Published var showView = false
    @Published var url: String?
    
    func getEpisodes(url: String, count: Int) {
        if count > 1 {
            DataFetcherServices.fetchEpisodes(urlString: url) { result in
                DispatchQueue.main.async {
                    guard let episodes = result else {return}
                    self.episodes = episodes
                }
            }
        } else {
            DataFetcherServices.fetchEpisode(urlString: url) { result in
                DispatchQueue.main.async {
                    guard let episode = result else {return}
                    self.episodes = [episode]
                }
            }
        }
    }
}

struct EpisodeCardView: View {
    
    @StateObject var viewModel = EpisodeCardViewModel()
//    var urls: String = "https://rickandmortyapi.com/api/episode/1,2,3,4,5,6"
//    var count: Int = 6
    @Binding var urls: String
    @State var count: Int
    
    var body: some View {
        VStack(spacing: 15) {
            HeaderButtonsView(needFav: false)
            
            VStack(alignment: .leading, spacing: 35) {
                Text("episodes".uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack() {
                        ForEach(viewModel.episodes ?? [AppData.episodeModel], id: \.self) { episode in
                            Button {
                                viewModel.showView = true
                                viewModel.url = episode.url
                            } label: {
                                HStack {
                                    Text(episode.name)
                                        .font(.system(size: 21, weight: .semibold))
                                        .lineLimit(2)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: 225, alignment: .leading)
                                        .padding(.horizontal)
                                        .padding(.vertical, 24)
                                }
                                .background(Image(imageExists(imageName: episode.name) ? episode.name : "DarkLocation").opacity(0.4))
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .cornerRadius(11)
                        .padding(.bottom, 7)
                        .sheet(isPresented: $viewModel.showView) {
                            LocationEpisodeCardView(viewModel: LocationEpisodeCardViewModel(), url: $viewModel.url, type: .episode)
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
        .padding(.top)
        .foregroundColor(.white)
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
