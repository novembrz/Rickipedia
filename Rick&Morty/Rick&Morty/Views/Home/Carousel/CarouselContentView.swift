//
//  CarouselContentView.swift
//  Rick&Morty
//
//  Created by dasha on 28.05.2021.
//

import SwiftUI
import Kingfisher

struct CarouselContentView: View {
    @EnvironmentObject var viewModel: CarouselViewModel
    @State private var showCard = false
    @State var name: String?
    
    var person: Person
    var scrolled: Int
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
                KFImage(URL(string: person.image ?? "https://pristor.ru/wp-content/uploads/2018/11/%D0%A0%D0%B8%D0%BA-%D0%B8-%D0%9C%D0%BE%D1%80%D1%82%D0%B8-%D0%BA%D0%BB%D0%B0%D1%81%D1%81%D0%BD%D1%8B%D0%B5-%D0%B8-%D0%BA%D1%80%D1%83%D1%82%D1%8B%D0%B5-%D0%BA%D0%B0%D1%80%D1%82%D0%B8%D0%BD%D0%BA%D0%B8-%D0%BD%D0%B0-%D0%B0%D0%B2%D1%83-%D0%B8-%D0%BD%D0%B0-%D0%B7%D0%B0%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D1%83-19-576x1024.jpg"))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    //динамический фрейм
                    .frame(width: calculateWidth(),
                           height: (height - CGFloat(person.index - scrolled) * 50))
                    .cornerRadius(15)
            
            VStack(alignment: .leading, spacing: 18) {
                HStack() {
                    Text(person.name)
                        .font(.title)
                        .fontWeight(.heavy)
                    
                    Spacer()
                }
                
                Button {
                    
                } label: {
                    Text("Read Latter")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 25)
                        .background(Color.blue)
                        .clipShape(Capsule())
                }
            }
            .frame(width: calculateWidth() - 40)
            .padding(.leading, 20)
            .padding(.bottom, 20)
        }
        .offset(x: person.index - scrolled <= 2 ? CGFloat(person.index - scrolled) * 30 : 60)
        .onTapGesture {
            withAnimation(.spring()) {
                name = person.name
                showCard.toggle()
            }
        }.sheet(isPresented: $showCard) {
            PersonCardView(name: $name)
        }
        
        Spacer(minLength: 0)
    }

}

struct CarouselContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


