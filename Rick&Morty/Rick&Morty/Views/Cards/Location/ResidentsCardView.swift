//
//  ResidentsCardView.swift
//  Rick&Morty
//
//  Created by dasha on 06.07.2021.
//

import SwiftUI
import Kingfisher

final class ResidentsCardViewModel: ObservableObject {
    @Published var residentsAr: [Person]?
    @Published var id: Int?
    @Published var isLoading = false
    @Published var showCard = false
    
    func getResidents(residents: [String]) {
        isLoading = true
        StringsConvert().makeOneURL(urls: residents, type: .char) { url, count in
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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Residents")
                .padding(.horizontal, 25)
                .font(.system(size: 25, weight: .bold))
                .padding(.top, 20)
                .frame(height: width / 6)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 16) {
                    ForEach(viewModel.residentsAr ?? [AppData.person], id: \.self) { person in
                        Button {
                            viewModel.showCard = true
                            viewModel.id = person.id
                        } label: {
                            VStack(spacing: 10) {
                                (viewModel.isLoading ? KFImage(URL(string: AppData.defaultImageUrl)) : KFImage(URL(string: person.image ?? AppData.defaultImageUrl)))
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
                        .sheet(isPresented: $viewModel.showCard) {
                            PersonCardView(id: $viewModel.id)
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
