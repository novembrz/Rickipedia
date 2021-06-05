//
//  HomeHeaderView.swift
//  Rick&Morty
//
//  Created by dasha on 28.05.2021.
//

import SwiftUI

struct HomeHeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            HStack {
                Button(action: {}, label: {
                    Image(systemName: "xmark")
                })
                
                Spacer()
                
                Button(action: {}, label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                })
            }
            
            Text("Placeholder")
                .font(.title)
                .fontWeight(.heavy)
        }
        .padding()
        .padding(.top, 30)
    }
}

struct HomeHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
