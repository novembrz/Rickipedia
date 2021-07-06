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
    
    func getLocation(url: String?) {
        DataFetcherServices().fetchCurrentLocation(url: url ?? "") { result in
            DispatchQueue.main.async {
                guard let location = result else {return}
                self.location = location
                print("🐯🐯🐯", location)
            }
        }
    }
}

//MARK: View

struct LocationCardView: View {
    
    @StateObject var viewModel = LocationCardViewModel()
    @Binding var url: String?
    
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
                            HeaderButtonsView()
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text(location.name)
                                    .font(.system(size: 35, weight: .bold))
                                
                                Text("\(location.dimension) / \(location.type)")
                                    .font(.system(size: 18, weight: .medium))
                            }
                        }
                        .padding()
                        
                        Spacer()
                        
                        ResidentsCardView()
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
