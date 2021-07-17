//
//  CardsView.swift
//  Rick&Morty
//
//  Created by dasha on 10.06.2021.
//

import SwiftUI
import Kingfisher

//MARK: - ViewModel
final class CardsViewModel: ObservableObject {
    @Published var persons: [Person] = []
    @Published var showCard = false
    @Published var isLoading = false
    @Published var id: Int?
    
    var columns: [GridItem] = Array(repeating: .init(.flexible(maximum: 140), spacing: 28, alignment: .top), count: 3)
    
    func getPersons() {
        isLoading = true
        DataFetcherServices().fetchAllPersons { [self] result in
            DispatchQueue.main.async {
                isLoading = false
                guard let personArray = result else {return}
                persons = personArray
            }
        }
    }
}

//MARK: - View
struct CardsView: View {
    @Binding var searchText: String
    @StateObject var viewModel = CardsViewModel()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: viewModel.columns) {
                ForEach((viewModel.persons).filter({"\($0)".contains(searchText) || searchText.isEmpty}), id: \.self) { person in
                    
                    VStack(spacing: 13) {
                        KFImage(URL(string: person.image ?? AppData.defaultImageUrl))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 90, height: 90)
                            .cornerRadius(8)
                        
                        Text(person.name)
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity, idealHeight: 150)
                    .onTapGesture {
                        viewModel.id = person.id
                        viewModel.showCard.toggle()
                    }.sheet(isPresented: $viewModel.showCard) {
                        PersonCardView(id: $viewModel.id)
                    }
                }
            }
        }
        .animation(.easeIn)
        .transition(.move(edge: .top))
        .onAppear() { viewModel.getPersons() }
        if viewModel.isLoading { LoadingView() }
    }
}

//MARK: - Previews
struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SearchViewModel())
    }
}
