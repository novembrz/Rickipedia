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
    //var id: Int?
    let maxHeigth = UIScreen.main.bounds.height / 1.32
    
    func getPerson(id: Int?) {
        DataFetcherServices().fetchPerson(id: id ?? 1) { result in
            DispatchQueue.main.async {
                guard let personAll = result else {return}
                self.person = personAll
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
                
                PersonView(person: viewModel.person ?? Person(index: 0, id: 0, name: "", image: "", status: "", species: "", type: "", gender: "", url: ""))
                
            }
            .background(Color("GrayElementColor"))
            .edgesIgnoringSafeArea(.all)
            .onAppear() { viewModel.getPerson(id: id) }
            
            HeaderButtonsView()
        }
    }
}

//MARK: HeaderButtonsView
struct HeaderButtonsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var isFav = false
    
    var body: some View {
        HStack() {
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "chevron.backward")
                    .resizable()
                    .frame(width: 9, height: 18)
                    .foregroundColor(.white)
            }
            Spacer()
            Button {
                // TODO: Add to favourite
                isFav.toggle()
            } label: {
                Image(isFav ? "heart.fill" : "heart")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .animation(.spring())
            }
        }
        .padding()
    }
}

//MARK: - Previews
//struct PersonsCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        PersonCardView()
//    }
//}
