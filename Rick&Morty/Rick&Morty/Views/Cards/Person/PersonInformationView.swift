//
//  PersonInformationView.swift
//  Rick&Morty
//
//  Created by dasha on 18.06.2021.
//

import SwiftUI

//MARK: View
struct PersonInformationView: View {
    
    var person: Person
    var columns: [GridItem] = Array(repeating: .init(.flexible(maximum: UIScreen.main.bounds.width / 2), spacing: 10, alignment: .topLeading), count: 2)
    
    var body: some View {
        VStack(spacing: 21) {
            
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white.opacity(0.5))
                .frame(width: 111, height: 7)
            
            HStack() {
                Text("Infornation")
                    .font(.system(size: 30, weight: .bold))
                
                Spacer()
                
                HStack(spacing: 15) {
                    Circle()
                        .frame(width: 7, height: 7)
                        .foregroundColor(getColor(person.status))
                    
                    Text(person.status.firstUppercased)
                        .font(.system(size: 20, weight: .regular))
                }
            }
            
            
            LazyVGrid(columns: columns, spacing: 20) {
                PersonInformationViewItem(image: "marsian", desc: person.species)
                PersonInformationViewItem(image: "gender", desc: person.gender)
                PersonInformationViewItem(image: "tentacles", desc: person.type)
            }
        }
    }
    
    private func getColor(_ status: String) -> Color {
        switch status {
        case "Alive":
            return .green
        case "Dead":
            return .red
        default:
            return .blue
        }
    }
}

//MARK: Item
struct PersonInformationViewItem: View {
    var image: String
    var desc: String
    
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .frame(width: 27, height: 27)
            Text(desc == "" || desc == "unknown" ? "???" : desc)
                .font(.system(size: 23, weight: .regular))
        }
    }
}

