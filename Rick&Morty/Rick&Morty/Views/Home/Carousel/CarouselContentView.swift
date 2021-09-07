//
//  CarouselContentView.swift
//  Rick&Morty
//
//  Created by dasha on 28.05.2021.
//

import SwiftUI
import Kingfisher


final class CarouselContentViewModel: ObservableObject {
    @Published var showCard = false
    @Published var showFav = false
    @Published var id: Int?
}

struct CarouselContentView: View {
    @ObservedObject var viewModel: CarouselContentViewModel
    
    var person: Person
    var scrolled: Int
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
            KFImage(URL(string: person.image ?? AppData.defaultImageUrl))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    //динамический фрейм
                    .frame(width: SizeGenerator.calculateWidth(),
                           height: (SizeGenerator.height - CGFloat(person.index - scrolled) * 50))
                    .cornerRadius(15)
            
            VStack(alignment: .leading, spacing: 18) {
                HStack() {
                    Text(person.name)
                        .font(.title)
                        .fontWeight(.heavy)
                    
                    Spacer()
                }
                
                Button {
                    viewModel.showFav = true
                } label: {
                    Text("􀊵 Add to Favorites")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 25)
                        .background(Color("accentBlue"))
                        .clipShape(Capsule())
                }
            }
            .frame(width: SizeGenerator.calculateWidth() - 40)
            .padding(.leading, 20)
            .padding(.bottom, 20)
        }
        .offset(x: person.index - scrolled <= 2 ? CGFloat(person.index - scrolled) * 30 : 60)
        .onTapGesture {
            viewModel.id = person.id
            viewModel.showCard.toggle()
        }
        .sheet(isPresented: $viewModel.showCard) {
            PersonCardView(id: $viewModel.id)
        }
        .sheet(isPresented: $viewModel.showFav) {
            
        }
        Spacer(minLength: 0)
    }

}

struct CarouselContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


