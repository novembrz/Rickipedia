//
//  CardView.swift
//  Rick&Morty
//
//  Created by dasha on 28.05.2021.
//

import SwiftUI

//В этот блок будет приходить id и происходить парс по персонажу

struct PersonCardView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var name: String?
    
    var body: some View {
        VStack {
            Text("Привет")
            Button {
                print("🐔🐔🐔", name)
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Закрыть")
                    .foregroundColor(.blue)
            }
        }
    }
}
