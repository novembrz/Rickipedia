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
    @State var name: String? //delete
    @State var id: Int?
    
    var person: Person
    var scrolled: Int
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
                KFImage(URL(string: person.image ?? defaultImageUrl))
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
            .frame(width: SizeGenerator.calculateWidth() - 40)
            .padding(.leading, 20)
            .padding(.bottom, 20)
        }
        .offset(x: person.index - scrolled <= 2 ? CGFloat(person.index - scrolled) * 30 : 60)
        .onTapGesture {
            withAnimation(.spring()) {
                id = person.id
                showCard.toggle()
            }
        }.sheet(isPresented: $showCard) {
            PersonCardView(id: $id)
        }
        
        Spacer(minLength: 0)
    }

}

struct CarouselContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


