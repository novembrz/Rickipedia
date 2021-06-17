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
    @Binding var id: Int?
    @State var person: Person?
    
    var body: some View {
        VStack {
            Text("Привет")
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Закрыть")
                    .foregroundColor(.blue)
            }
        }.onAppear() {
            DataFetcherServices().fetchPerson(id: id ?? 1) { result in
                guard let person = result else {return}
                self.person = person
                print("🐔🐔🐔", person)
            }
        }
    }
}
