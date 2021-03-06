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
    @Published var person: PersonModel?
    @Published var show = false
    @Published var location: LocationModel?
    @Published var origin: LocationModel?
    //var id: Int?
    let maxHeigth = UIScreen.main.bounds.height / 1.32
    
    func getPerson(id: Int?) {
        DataFetcherServices.fetchPerson(id: id ?? 1) { result in
            DispatchQueue.main.async {
                self.person = result
                self.getLocation()
                self.getOrigin()
            }
        }
    }
    
    func getLocation() {
        if let locationURL = person?.location?.url {
            DataFetcherServices.fetchLocation(urlString: locationURL) { result in
                DispatchQueue.main.async {
                    guard let location = result else { return }
                    self.location = location
                }
            }
        }
    }
    
    func getOrigin() {
        if let originURL = person?.origin?.url {
            DataFetcherServices.fetchLocation(urlString: originURL) { result in
                DispatchQueue.main.async {
                    guard let origin = result else {return}
                    self.origin = origin
                }
            }
        }
    }
}

//MARK: - View
struct PersonCardView: View {
    //var id = 1
    @Binding var id: Int?
    @StateObject var viewModel = PersonCardViewModel()
    
    @State var selectedTab = "house"
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView(.vertical, showsIndicators: false) {
                //MARK: Parallax
                GeometryReader { reader in
                    KFImage(URL(string: viewModel.person?.image ?? AppData.defaultImageUrl))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .offset(y: -reader.frame(in: .global).minY)
                        .frame(width: UIScreen.main.bounds.width,
                               height: reader.frame(in: .global).minY + viewModel.maxHeigth)
                    
                    Image("bottomLinerGradient")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .offset(y: -reader.frame(in: .global).minY)
                        .frame(width: UIScreen.main.bounds.width, height: reader.frame(in: .global).minY + viewModel.maxHeigth)
                }
                .frame(height: viewModel.maxHeigth)
                
                PersonView(person: viewModel.person ?? AppData.personModel,
                           location: viewModel.location,
                           origin: viewModel.origin)
                    .offset(y: -50)
            }
            .background(Color("GrayElementColor"))
            .edgesIgnoringSafeArea(.all)
            .onAppear() {
                viewModel.getPerson(id: id)
            }
            
            HeaderButtonsView(needFav: true)
        }
    }
}

//MARK: - Previews
//struct PersonsCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        PersonCardView()
//    }
//}
