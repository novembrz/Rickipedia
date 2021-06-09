//
//  FilterMenuView.swift
//  Rick&Morty
//
//  Created by dasha on 09.06.2021.
//

import SwiftUI

struct FilterMenuView: View {
    var body: some View {
        HStack(spacing: 22) {
            ForEach((0..<4), id: \.self) { item in
                Button {
                    
                } label: {
                    Text("A")
                }
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.3))
            }
        }
        
        .animation(.easeIn)
        .transition(.move(edge: .top))
    }
}

struct FilterMenuView_Previews: PreviewProvider {
    static var previews: some View {
        FilterMenuView()
    }
}
