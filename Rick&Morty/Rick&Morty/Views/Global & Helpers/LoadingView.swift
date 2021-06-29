//
//  LoadingView.swift
//  Rick&Morty
//
//  Created by dasha on 24.06.2021.
//

import SwiftUI

struct LoadingView: View {
    @State var animate = false
    
    var body: some View {
        GeometryReader { _ in
            VStack(alignment: .center) {
                Image("colorRick")
                    .resizable()
                    .frame(width: 60, height: 60, alignment: .center)
                    .rotationEffect(.init(degrees: self.animate ? 360 : 0))
                    .animation(Animation.linear(duration: 0.7).repeatForever(autoreverses: false))
            }
            .offset(x: 150, y: -250)
            .onAppear() {
                self.animate.toggle()
            }
        }.background(Color("GrayBgColor").edgesIgnoringSafeArea(.all))
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}


