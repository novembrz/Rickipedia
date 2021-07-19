//
//  PersonsFavouriteView.swift
//  Rick&Morty
//
//  Created by dasha on 19.07.2021.
//

import SwiftUI

final class PersonsFavouriteViewModel: ObservableObject {
    @Published var id: Int?
    @Published var showCard = false
}

struct PersonsFavouriteView: View {
    
    @ObservedObject var viewModel = PersonsFavouriteViewModel()
    
    var columns: [GridItem] = Array(repeating: .init(.flexible(maximum: 140), spacing: 31, alignment: .top), count: 3)
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns) {
                ForEach(0...10, id: \.self) { person in
                    VStack(spacing: 13) {
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.size.width / 3.8, height: UIScreen.main.bounds.size.width / 2.3)
                            .cornerRadius(8)
                            .foregroundColor(.blue)
                        
                        Text("\(person)")
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                    }
                    .onTapGesture {
                        //viewModel.id = person.id
                        viewModel.id = 1
                        viewModel.showCard.toggle()
                    }.sheet(isPresented: $viewModel.showCard) {
                        PersonCardView(id: $viewModel.id)
                    }
                }
            }
            .padding(.top, 130)
        }
    }
}

struct PersonsFavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView()
    }
}
