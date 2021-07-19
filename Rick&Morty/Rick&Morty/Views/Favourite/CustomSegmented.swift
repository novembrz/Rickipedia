//
//  CustomSegmented.swift
//  Rick&Morty
//
//  Created by dasha on 19.07.2021.
//

import SwiftUI

struct CustomSegmented: View {
    @Binding var selected: Int
    
    var body: some View {
        ZStack {
            HStack(spacing: 2) {
                Button {
                    self.selected = 0
                } label: {
                    Image("marsian")
                        .resizable()
                        .frame(width: 31, height: 31)
                        .padding(.vertical, 8)
                        .padding(.leading, 14)
                        .padding(.trailing, 12)
                        .background(selected == 0 ? Color.white : Color("GrayBgColor"))
                        .foregroundColor(selected == 0 ? Color("GrayBgColor") : Color.white)
                }
                
                Button {
                    self.selected = 1
                } label: {
                    Image("planet")
                        .resizable()
                        .frame(width: 29, height: 29)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 13)
                        .background(selected == 1 ? Color.white : Color("GrayBgColor"))
                        .foregroundColor(selected == 1 ? Color("GrayBgColor") : Color.white)
                }
            }
            .background(Color.white)
            .clipShape(Capsule())
            .animation(.spring())
            
            RoundedRectangle(cornerRadius: 30)
                .stroke(Color.white, lineWidth: 2)
                .frame(width: 116, height: 48)
        }
    }
}

struct CustomSegmented_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView()
    }
}
