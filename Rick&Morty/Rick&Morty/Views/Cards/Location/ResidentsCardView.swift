//
//  ResidentsCardView.swift
//  Rick&Morty
//
//  Created by dasha on 06.07.2021.
//

import SwiftUI
import Kingfisher

class ResidentsCardViewModel: ObservableObject {
    @Published var residentsAr: [Person]?
    @Published var isLoading = false
    
    func getResidents(residents: [String]) {
        isLoading = true
        StringsConvert().makeOneURL(urls: residents) { url, count in
            DataFetcherServices().fetchResidents(url: url, count: count) { result in
                DispatchQueue.main.async {
                    //self.isLoading = false
                    guard let residents = result else {return}
                    self.residentsAr = residents
                    self.isLoading = false
                }
            }
        }
    }
}

struct ResidentsCardView: View {
    
    @StateObject var viewModel = ResidentsCardViewModel()
    
    var residents: [String]
    let width = UIScreen.main.bounds.width
    let person = [Person(index: 0, id: 0, name: "", image: "", status: "", species: "", type: "", gender: "", url: "", origin: PersonOrigin(name: "", url: ""), location: PersonLocation(name: "", url: ""), episode: [])]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Residents")
                .padding(.horizontal, 25)
                .font(.system(size: 25, weight: .bold))
                .padding(.top, 20)
                .frame(height: width / 6)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 16) {
                    ForEach(viewModel.residentsAr ?? person, id: \.self) { person in
                        Button {
                            
                        } label: {
                            VStack(spacing: 10) {
                                (viewModel.isLoading ? KFImage(URL(string: defaultImageUrl)) : KFImage(URL(string: person.image ?? defaultImageUrl)))
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: width / 4.2, height: width / 4.2)
                                    .cornerRadius(8)
                                
                                Text(person.name)
                                    .font(.system(size: 15, weight: .regular))
                                    .lineLimit(2)
                                    .multilineTextAlignment(.center)
                                    .frame(width: width / 4.2)
                            }
                        }
                    }
                }
                .padding(.horizontal, 25)
            }
        }
        .padding(.top)
        .background(Color("GrayElementColor"))
        .offset(y: -20)
        .cornerRadius(15)
        .onAppear() {
            viewModel.getResidents(residents: residents)
        }
    }
}

//MARK: - Previews
//struct ResidentsCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        LocationCardView(viewModel: LocationCardViewModel())
//    }
//}
