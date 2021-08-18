//
//  CustomTextField.swift
//  Rick&Morty
//
//  Created by dasha on 18.08.2021.
//

import SwiftUI

struct CustomTextField: View {
    
    @State var text = ""
    
    var placeholder: String
    var imageName: String
    
    var body: some View {
        TextField("", text: $text)
            .foregroundColor(.white)
            .accentColor(Color("accentGreen"))
            .disableAutocorrection(true)
            .padding(.horizontal)
            .overlay(
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.white, lineWidth: 1)
                        .frame(height: 45)
                        .foregroundColor(.white)
                    
                    HStack {
                        if text == "" {
                            HStack(spacing: 10) {
                                Image(imageName)
                                    .resizable()
                                    .frame(width: 22, height: 22)
                                
                                Text(placeholder)
                                    .font(.system(size: 16, weight: .regular))
                            }
                            .foregroundColor(.white.opacity(0.8))
                        }
                        
                        Spacer()
                        
                        if text != "" {
                            Button {
                                text = ""
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                                    .padding(.vertical)
                                    .foregroundColor(.white.opacity(0.8))
                            }
                        }
                    }
                    .padding(.horizontal, 12)
                    .foregroundColor(Color(.systemGray))
                }
            )
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
