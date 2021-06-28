//
//  PersonView.swift
//  Rick&Morty
//
//  Created by dasha on 18.06.2021.
//

import SwiftUI
import Kingfisher

//MARK: - ViewModel
final class PersonCardViewModel: ObservableObject {
    @Published var person: Person?
    @Published var show = false
    @Published var location: Location?
    @Published var origin: Location?
    //var id: Int?
    let maxHeigth = UIScreen.main.bounds.height / 1.32
    
    func getPerson(id: Int?) {
        DataFetcherServices().fetchPerson(id: id ?? 1) { result in
            DispatchQueue.main.async {
                guard let person = result else {return}
                self.person = person
                self.getLocation()
                self.getOrigin()
            }
        }
    }
    
    func getLocation() {
        if let locationURL = person?.location?.url {
            DataFetcherServices().fetchCurrentLocation(url: locationURL) { result in
                DispatchQueue.main.async {
                    guard let location = result else {return}
                    self.location = location
                }
            }
        }
    }
    
    func getOrigin() {
        if let originURL = person?.origin?.url {
            DataFetcherServices().fetchCurrentLocation(url: originURL) { result in
                DispatchQueue.main.async {
                    guard let origin = result else {return}
                    self.location = origin
                }
            }
        }
    }
}

//MARK: - View
struct PersonCardView: View {
    @Binding var id: Int?
    @ObservedObject var viewModel = PersonCardViewModel()
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView(.vertical, showsIndicators: false) {
                //MARK: Parallax
                GeometryReader { reader in
                    KFImage(URL(string: viewModel.person?.image ?? defaultImageUrl))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .offset(y: -reader.frame(in: .global).minY)
                        .frame(width: UIScreen.main.bounds.width,
                               height: reader.frame(in: .global).minY + viewModel.maxHeigth)
                }
                .frame(height: viewModel.maxHeigth)
                
                PersonView(person: viewModel.person ??
                            Person(index: 0, id: 0, name: "", image: "", status: "", species: "", type: "", gender: "", url: "", origin: PersonOrigin(name: "", url: ""), location: PersonLocation(name: "", url: ""), episode: []),
                           location: viewModel.location,
                           origin: viewModel.origin)
            }
            .background(Color("GrayElementColor"))
            .edgesIgnoringSafeArea(.all)
            .onAppear() {
                viewModel.getPerson(id: id)
            }
            
            HeaderButtonsView()
        }
    }
}

//MARK: - Previews
//struct PersonsCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        PersonCardView()
//    }
//}
