//
//  CarouselContentView.swift
//  Rick&Morty
//
//  Created by dasha on 28.05.2021.
//

import SwiftUI
import Kingfisher

<<<<<<< HEAD
//MARK: - ViewModel
final class CarouselViewModel: ObservableObject {
    @Published var showCard = false
    @Published var id: Int?
    @Published var person: Person
    @Published var scrolled: Int
=======
struct CarouselContentView: View {
    @EnvironmentObject var viewModel: CarouselViewModel
    @State private var showCard = false
    @State var name: String?
>>>>>>> parent of fa54670 (Refactored the NetworkService)
    
    init(person: Person, scrolled: Int) {
        self.person = person
        self.scrolled = scrolled
    }
}


//MARK: - View
struct CarouselContentView: View {
    @StateObject var viewModel: CarouselViewModel
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
<<<<<<< HEAD
            KFImage(URL(string: viewModel.person.image ?? defaultImageUrl))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    //динамический фрейм
                    .frame(width: SizeGenerator.calculateWidth(),
                           height: (SizeGenerator.height - CGFloat(viewModel.person.index - viewModel.scrolled) * 50))
=======
                KFImage(URL(string: person.image ?? "https://pristor.ru/wp-content/uploads/2018/11/%D0%A0%D0%B8%D0%BA-%D0%B8-%D0%9C%D0%BE%D1%80%D1%82%D0%B8-%D0%BA%D0%BB%D0%B0%D1%81%D1%81%D0%BD%D1%8B%D0%B5-%D0%B8-%D0%BA%D1%80%D1%83%D1%82%D1%8B%D0%B5-%D0%BA%D0%B0%D1%80%D1%82%D0%B8%D0%BD%D0%BA%D0%B8-%D0%BD%D0%B0-%D0%B0%D0%B2%D1%83-%D0%B8-%D0%BD%D0%B0-%D0%B7%D0%B0%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D1%83-19-576x1024.jpg"))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    //динамический фрейм
                    .frame(width: calculateWidth(),
                           height: (height - CGFloat(person.index - scrolled) * 50))
>>>>>>> parent of fa54670 (Refactored the NetworkService)
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
            .frame(width: calculateWidth() - 40)
            .padding(.leading, 20)
            .padding(.bottom, 20)
        }
        .offset(x: viewModel.person.index - viewModel.scrolled <= 2 ? CGFloat(viewModel.person.index - viewModel.scrolled) * 30 : 60)
        .onTapGesture {
            withAnimation(.spring()) {
<<<<<<< HEAD
                viewModel.id = viewModel.person.id
                viewModel.showCard.toggle()
            }
        }.sheet(isPresented: $viewModel.showCard) {
            PersonCardView(id: $viewModel.id)
=======
                name = person.name
                showCard.toggle()
            }
        }.sheet(isPresented: $showCard) {
            PersonCardView(name: $name)
>>>>>>> parent of fa54670 (Refactored the NetworkService)
        }
        Spacer(minLength: 0)
    }
}

struct CarouselContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarRouterView(viewRouter: Router())
    }
}


