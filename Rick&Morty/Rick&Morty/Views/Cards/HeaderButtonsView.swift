//
//  HeaderButtonsView.swift
//  Rick&Morty
//
//  Created by dasha on 24.06.2021.
//

import SwiftUI

struct HeaderButtonsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var isFav = false
    @State var needFav: Bool
    
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
            
            if needFav == true{
                Button {
                    // TODO: Add to favourite Person and Location
                    isFav.toggle()
                } label: {
                    Image(isFav ? "heart.fill" : "heart")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                .animation(.spring())
            }
        }
        .padding()
    }
}
