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
                PlayerImageView(size: 250)
                soccerData
                contactData
                socialData
                
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
    
    var contactData: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Email".uppercased())
                    .font(.caption)
                    .foregroundColor(Color.theme.secondaryText)

                Text(player.email)
                    .font(.body)
                    .fontWeight(.heavy)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text("Phone".uppercased())
                    .font(.caption)
                    .foregroundColor(Color.theme.secondaryText)

                Text(player.cellPhone)
                    .font(.body)
                    .fontWeight(.heavy)
            }
        }
        .padding()
    }
    
    var socialData: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Twitter".uppercased())
                    .font(.caption)
                    .foregroundColor(Color.theme.secondaryText)

                Text(player.twitter)
                    .font(.body)
                    .fontWeight(.heavy)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text("Instagram".uppercased())
                    .font(.caption)
                    .foregroundColor(Color.theme.secondaryText)

                Text(player.instagram)
                    .font(.body)
                    .fontWeight(.heavy)
            }
        }
        .padding()
    }
}
