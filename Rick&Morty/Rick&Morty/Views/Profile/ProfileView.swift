//
//  ProfileView.swift
//  Rick&Morty
//
//  Created by dasha on 18.08.2021.
//

import SwiftUI

struct ProfilePageView: View {
    var body: some View {
        ProfileView()
        //        if signIn {
        //            ProfileView()
        //        } else {
        //            LoginPageView()
        //        }
    }
}

struct ProfileView: View {
    
    var height = UIScreen.main.bounds.height
    
    var linerGradient = LinearGradient(gradient: Gradient(colors: [Color("accentBlue"), Color("accentGreen")]), startPoint: .leading, endPoint: .trailing)
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 100) {
                VStack(spacing: 41) {
                    VStack(spacing: 20) {
                        ZStack {
                            Image("photoEllipse")
                                .frame(width: 110, height: 110)
                            
                            Image("DarkLocation")
                                .frame(width: 102, height: 102)
                                .clipShape(Circle())
                        }
                        .padding(.top, height / 19)
                        
                        VStack(spacing: 6) {
                            Text("Wubba lubba dub dub,")
                                .font(.system(size: 16, weight: .regular))
                            
                            Text("Dasha!")
                                .font(.system(size: 20, weight: .medium))
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 16) {
                        SettingsButtonView(image: "galaxy", title: "Change password")
                        SettingsButtonView(image: "asteroid", title: "Notifications")
                        SettingsButtonView(image: "robot", title: "Language")
                        SettingsButtonView(image: "hand", title: "Support service")
                    }
                }
                
                VStack(alignment: .leading, spacing: 16) {
                    Button {} label: {
                        Text("Delite Account")
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 0.2509803922, blue: 0.2941176471, alpha: 1)))
                            .font(.system(size: 18, weight: .medium))
                            .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                            .cornerRadius(8)
                    }
                    
                    Button {} label: {
                        Text("Sign Out")
                            .font(.system(size: 18, weight: .medium))
                            .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                            .background(Color(#colorLiteral(red: 1, green: 0.2509803922, blue: 0.2941176471, alpha: 1)))
                            .cornerRadius(8)
                    }
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .viewSettings()
    }
}

struct SettingsButtonView: View {
    
    var image: String
    var title: String
    
    var body: some View {
        Button {} label: {
            HStack {
                Image(image)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.leading, 11)
                
                Text(title)
                    .padding(.leading, 7)
                    .font(.system(size: 18, weight: .medium))
            }
            .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            .background(Color("GrayElementColor"))
            .cornerRadius(8)
        }
    }
}
