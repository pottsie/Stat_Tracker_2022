//
//  PlayerProfileView.swift
//  Stat_Tracker_2022
//
//  Created by Michael Potts on 1/23/22.
//

import SwiftUI

struct PlayerProfileView: View {
    let player: PlayerProfile
    
    var body: some View {
        NavigationView {
            VStack {
//                header
                PlayerImageView(size: 200)
                soccerData
                    .padding(.bottom)
                
                if let email = player.email {
                    socialMedia(label: "Email", value: email)
                }
                if let phone = player.cellPhone {
                    socialMedia(label: "Phone", value: phone)
                }
                if let twitter = player.twitter {
                    socialMedia(label: "Twitter", value: twitter)
                }
                if let instagram = player.instagram {
                    socialMedia(label: "Instagram", value: instagram)
                }
                
//                contactData
//                socialData
                
                Spacer()
            }
            .navigationTitle(player.name)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        //
                    } label: {
                        Label("Settings", systemImage: "gear")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //
                    } label: {
                        Label("Edit profile", systemImage: "pencil")
                    }
                }
            }
        }
    }
    
    func socialMedia(label: String, value: String) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(label.uppercased())
                    .font(.caption)
                    .foregroundColor(Color.theme.secondaryText)
                Text(value)
                    .fontWeight(.heavy)
            }
            Spacer()
        }
        .padding([.horizontal, .bottom])
    }
}

struct PlayerProfileView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerProfileView(player: dev.player)
    }
}

extension PlayerProfileView {
//    var header: some View {
//        Text(player.name)
//            .font(.largeTitle)
//            .fontWeight(.bold)
//            .foregroundColor(Color.theme.accent)
//            .padding()
//    }
    
    var soccerData: some View {
        VStack {
            Text("#\(player.jerseyNumber)")
            Text(player.position)
            Text(player.dateOfBirth.asString() + " (\(player.ageGroup))")
        }
        .font(.title2)
        .foregroundColor(Color.theme.secondaryText)
    }
}
