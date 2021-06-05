//
//  SearchView.swift
//  Rick&Morty
//
//  Created by dasha on 05.06.2021.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 35) {
            HStack {
                Text("SEARCH")
                    .font(.title)
                    .fontWeight(.heavy)
                
                Spacer()
                
                Button {
                    // filter
                } label: {
                    Image("filter")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .foregroundColor(.white)
                }
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                //response
            }
        }
        .foregroundColor(.white)
        .padding()
        .padding(.top, 60)
        .background(Color("GrayBgColor"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
