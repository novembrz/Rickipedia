//
//  LocCardView.swift
//  Rick&Morty
//
//  Created by dasha on 06.07.2021.
//

import SwiftUI
import Kingfisher

//MARK: ViewModel

final class LocationCardViewModel: ObservableObject {
    @Published var location: Location?
    @Published var residents: [String]?
    @Published var isLoading = false
    
    func getLocation(url: String?) {
        DataFetcherServices().fetchLocation(url: url ?? "") { result in
            DispatchQueue.main.async {
                guard let location = result?[0] else {return}
                self.location = location
                self.residents = location.residents
            }
        }
    }
}

//MARK: View

struct LocationCardView: View {
    
    @StateObject var viewModel = LocationCardViewModel()
    @Binding var url: String?
    //var url: String = "https://rickandmortyapi.com/api/location/13"
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var body: some View {
        VStack(alignment: .leading) {
            if let location = viewModel.location {
                ZStack(alignment: .top) {
                    
                    Image(imageExists(imageName: location.name) ? location.name : "DarkLocation")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: width,
                               height: height / 4 * 3)
                    
                    Image("topLinerGradient")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: width, height: height / 4 * 3)
                    
                    VStack {
                        VStack(alignment: .leading) {
                            HeaderButtonsView(needFav: true)
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text(location.name)
                                    .font(.system(size: 35, weight: .bold))
                                
                                Text("\(location.dimension) / \(location.type)")
                                    .font(.system(size: 18, weight: .medium))
                            }
                        }
                        .padding()
                        
                        Spacer()
                        
                        ResidentsCardView(residents: viewModel.residents ?? [""])
                    }
                }
            }
        }
        .foregroundColor(.white)
        .background(Color("GrayElementColor"))
        .ignoresSafeArea()
        .onAppear() { viewModel.getLocation(url: url) }
    }
}

//MARK: - Previews
//struct LocationCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        LocationCardView(viewModel: LocationCardViewModel())
//    }
//}
