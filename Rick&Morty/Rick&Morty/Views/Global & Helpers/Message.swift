//
//  Message.swift
//  Rick&Morty
//
//  Created by dasha on 20.08.2021.
//

import SwiftUI
import UIKit

enum MessageState {
    case success
    case warning
    case error
}


final class MessageViewModel: ObservableObject {
    @Published var color: String = ""
    @Published var icon: String = ""
    
    func messageStyle(state: MessageState) {
        switch state {
        case .success:
            self.icon = "rick"
            self.color = ""
        case .warning:
            self.icon = ""
            self.color = "Violet"
        case .error:
            self.icon = "comet"
            self.color = "Error"
        }
    }
}

struct MessageView: View {
    
    var text: String
    var state: MessageState
    
    @ObservedObject var viewModel: MessageViewModel
    
    @State var setOn = false
    @State var timeRemaining = 3
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    let height = UIScreen.main.bounds.size.height / 2
    let bannerHeight: CGFloat = 48
    
    
    var body: some View {
        ZStack {
            
            Button {} label: {
                
            }
            
            HStack(spacing: 12) {
                Image(viewModel.icon)
                    .resizable()
                    .frame(width: 27, height: 27)
                
                Text(text)
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding(16)
            //.background(viewModel.color == "" ? LinearGradient.rmGradient() : Color(viewModel.color))
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
            .cornerRadius(8)
            .padding(16)
            .shadow(color: Color.black.opacity(0.23), radius: 20)
            .offset(y: setOn ? -height + bannerHeight + 15 : -height - bannerHeight)
            .animation(.linear(duration: 0.3))
            .onReceive(timer) { _ in
                if timeRemaining > 0 {
                    setOn = true
                    timeRemaining -= 1
                } else {
                    setOn = false
                }
            }
            .onAppear() {
                viewModel.messageStyle(state: state)
            }
        }
    }
}

//struct MessageView_Previews: PreviewProvider {
//    static var previews: some View {
//        //MessageView(viewModel: MessageViewModel())
////        MessageView(text: "Account created successfully", color: "Error", icon: "rick", state: .error)
//    }
//}
