//
//  FavouriteView.swift
//  Rick&Morty
//
//  Created by dasha on 19.07.2021.
//

import SwiftUI

struct FavouriteView: View {
    
    @State var segmented = 0
    
    var body: some View {
        ZStack {
            if segmented == 0 {
                PersonsFavouriteView()
            } else if segmented == 1 {
                LocationsFavouriteView()
            }
            
            VStack {
                HStack {
                    Text("Favourite")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    
                    Spacer()
                    
                    CustomSegmented(selected: $segmented)
                }
                .padding(.top, 60)
                
                Spacer()
            }
        }
    }
}

struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView()
    }
}
