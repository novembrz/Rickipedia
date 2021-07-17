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
    @Binding var urls: String
    @Binding var count: Int
    
    var body: some View {
        VStack(spacing: 15) {
            HeaderButtonsView(needFav: false)
            
            VStack(alignment: .leading, spacing: 35) {
                Text("episodes".uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                SearchBarView(viewModel: SearchViewModel())
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    ForEach(0...10, id: \.self) { episode in
                        HStack {
                            Text("\(episode)")
                                .padding()
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
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
