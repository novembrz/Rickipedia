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
    
    var body: some View {
        VStack() {
            Text(person.name)
                .font(.system(size: 35, weight: .bold))
                .frame(width: 230, alignment: .topLeading)
                .offset(x: -60)
            
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
            
        }
        .offset(y: -80)
    }
}
