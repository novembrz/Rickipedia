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
        VStack(alignment: .leading, spacing: 45) {
            HStack {
                Text("Favourite")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                Spacer()
                
                CustomSegmented(selected: $segmented)
            }
            
            if segmented == 0 {
                PersonsFavouriteView()
            } else if segmented == 1 {
                LocationsFavouriteView()
            }
            
            Spacer()
        }
    }
}

struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView()
    }
}
