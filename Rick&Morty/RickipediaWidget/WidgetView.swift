//
//  WidgetView.swift
//  RickipediaWidgetExtension
//
//  Created by dasha on 13.09.2021.
//

import SwiftUI

struct WidgetView: View {
    
    let person: WidgetModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 13) {
            HStack(alignment: .top, spacing: 13) {
                Image(person.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 87, height: 87)
                    .cornerRadius(8)
                
                Image("appIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 28, height: 28)
                    .cornerRadius(5)
            }
            
            VStack(alignment: .leading, spacing: 3) {
                Text(person.name.uppercased())
                    .fontWeight(.bold)
                    .font(.system(size: 11))
                
                Text("Learn more")
                    .fontWeight(.light)
                    .font(.system(size: 11))
            }
        }
        .foregroundColor(.white)
        .padding(11)
        .background(Color("GrayBgColor"))
        .edgesIgnoringSafeArea(.all)
    }
}

