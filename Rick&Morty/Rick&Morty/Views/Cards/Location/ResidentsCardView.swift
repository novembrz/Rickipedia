//
//  ResidentsCardView.swift
//  Rick&Morty
//
//  Created by dasha on 06.07.2021.
//

import SwiftUI

struct ResidentsCardView: View {
    
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Residents")
                .padding(.horizontal, 25)
                .font(.system(size: 25, weight: .bold))
                .padding(.top, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(0...10, id: \.self) { el in
                        Button {
                            
                        } label: {
                            VStack(spacing: 10) {
                                Image("LightLocation")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: width / 4.2 , height: width / 4.2)
                                    .cornerRadius(8)
                                
                                Text("Lolly Pop")
                                    .font(.system(size: 15, weight: .regular))
                                    .lineLimit(2)
                            }
                        }
                    }
                }
                .padding(.horizontal, 25)
            }
        }
        .padding(.top)
        .frame(width: width, height: width / 1.8)
        .background(Color("GrayElementColor"))
        .offset(y: -20)
        .cornerRadius(15)
    }
}
