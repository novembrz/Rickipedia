//
//  HeaderView.swift
//  Rick&Morty
//
//  Created by dasha on 09.06.2021.
//

import SwiftUI

struct HeaderView: View {
    
    @State var title: String
    @Binding var isPerformed: Bool
    
    var body: some View {
        HStack {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.heavy)

            Spacer()

            Button {
                isPerformed.toggle()
            } label: {
                Image(title ?? "")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .foregroundColor(.white)
            }
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
