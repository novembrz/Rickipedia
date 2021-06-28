//
//  PersonView.swift
//  Rick&Morty
//
//  Created by dasha on 24.06.2021.
//

import SwiftUI

//MARK: PersonView
struct PersonView: View {
    var person: Person
    var location: Location?
    var origin: Location?
    
    var body: some View {
        VStack() {
            Text(person.name)
                .font(.system(size: 35, weight: .bold))
                .frame(width: 230, alignment: .topLeading)
                .offset(x: -60)
            
            VStack(spacing: 45) {
                PersonInformationView(person: person)
                PersonLocationView(origin: origin, location: location)
                Button {
                    // TODO: Routing to EpisodeViewController
                    print(person.name, person.episode)
                } label: {
                    Text("See person's episodes".uppercased())
                        .font(.system(size: 16, weight: .bold))
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 12)
                        .foregroundColor(Color.white)
                        .frame(height: 42)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.white, lineWidth: 2)
                                .frame(height: 40)
                        )
                }
            }
            .foregroundColor(.white)
            .padding(.top, 20)
            .padding(.horizontal, 23)
            .background(Color("GrayElementColor"))
            .cornerRadius(20)
            
        }
        .offset(y: -80)
    }
}
