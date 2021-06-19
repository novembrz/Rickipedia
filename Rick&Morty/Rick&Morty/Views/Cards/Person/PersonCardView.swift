//
//  PersonView.swift
//  Rick&Morty
//
//  Created by dasha on 18.06.2021.
//

import SwiftUI
import Kingfisher

struct PersonCardView: View {
    
    @State var person: Person?
    @State var show = false
    @Binding var id: Int?
    //var id: Int?
    let maxHeigth = UIScreen.main.bounds.height / 1.32
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView(.vertical, showsIndicators: false) {
                //MARK: Parallax
                GeometryReader { reader in
                    KFImage(URL(string: person?.image ?? defaultImageUrl))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .offset(y: -reader.frame(in: .global).minY)
                        .frame(width: UIScreen.main.bounds.width,
                               height: reader.frame(in: .global).minY + maxHeigth)
                }
                .frame(height: maxHeigth)
                
                PersonView(person: person ?? Person(index: 0, id: 0, name: "", image: "", status: "", species: "", type: "", gender: "", url: ""))
                
            }
            .background(Color("GrayElementColor"))
            .edgesIgnoringSafeArea(.all)
            .onAppear() {
                DataFetcherServices().fetchPerson(id: id ?? 1) { result in
                    guard let personAll = result else {return}
                    self.person = personAll
                }
            }
            
            HeaderButtonsView()
        }
    }
}

//MARK: PersonView
struct PersonView: View {
    
    var person: Person
    
    var body: some View {
        VStack(spacing: 45) {
            
            PersonInformationView(person: person)
            PersonLocationView(person: person)
            Button {
                // TODO: Routing to EpisodeViewController
            } label: {
                Text("SEE PERSON’S EPISODES")
                    .font(.system(size: 20, weight: .medium))
            }
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity)
            .cornerRadius(10)
            .border(Color.white, width: 2)
            .cornerRadius(10)
            
        }
        .foregroundColor(.white)
        .padding(.top, 20)
        .padding(.horizontal, 23)
        .background(Color("GrayElementColor"))
        .cornerRadius(20)
        .offset(y: -30)
    }
}

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

//struct PersonsCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        PersonCardView()
//    }
//}
