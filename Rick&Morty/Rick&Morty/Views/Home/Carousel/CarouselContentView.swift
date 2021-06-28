//
//  CarouselContentView.swift
//  Rick&Morty
//
//  Created by dasha on 28.05.2021.
//

import SwiftUI
import Kingfisher

//MARK: - ViewModel
final class CarouselViewModel: ObservableObject {
    @Published var showCard = false
    @Published var id: Int?
    @Published var person: Person
    @Published var scrolled: Int
    
    init(person: Person, scrolled: Int) {
        self.person = person
        self.scrolled = scrolled
    }
}


//MARK: - View
struct CarouselContentView: View {
    @ObservedObject var viewModel: CarouselViewModel
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
            KFImage(URL(string: viewModel.person.image ?? defaultImageUrl))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    //динамический фрейм
                    .frame(width: SizeGenerator.calculateWidth(),
                           height: (SizeGenerator.height - CGFloat(viewModel.person.index - viewModel.scrolled) * 50))
                    .cornerRadius(15)
            
            VStack(alignment: .leading, spacing: 18) {
                HStack() {
                    Text(viewModel.person.name)
                        .font(.title)
                        .fontWeight(.heavy)
                    
                    Spacer()
                }
                
                Button {
                    
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
        .offset(x: viewModel.person.index - viewModel.scrolled <= 2 ? CGFloat(viewModel.person.index - viewModel.scrolled) * 30 : 60)
        .onTapGesture {
            withAnimation(.spring()) {
                viewModel.id = viewModel.person.id
                viewModel.showCard.toggle()
            }
        }.sheet(isPresented: $viewModel.showCard) {
            PersonCardView(id: $viewModel.id)
        }
        Spacer(minLength: 0)
    }
}

struct CarouselContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarRouterView(viewRouter: Router())
    }
}


