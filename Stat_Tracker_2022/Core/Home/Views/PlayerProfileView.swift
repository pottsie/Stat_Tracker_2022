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
                Text(player.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
//                    .foregroundColor(Color.red)
                    .padding()
                Image("profile.jpeg")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 250, height: 250)
                    .overlay(Circle().stroke(lineWidth: 3))
                    .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 0)
                VStack {
                Text("#\(player.jerseyNumber)")
                Text(player.position)
                Text(player.dateOfBirth.asString() + " (\(player.ageGroup))")
                }
                .font(.title2)
                .foregroundColor(.secondary)
                HStack {
                    VStack(alignment: .leading) {
                        Text("Email".uppercased())
                            .font(.caption)
                        Text(player.email)
                            .font(.body)
                            .fontWeight(.heavy)
                    }
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("Phone".uppercased())
                            .font(.caption)
                        Text(player.cellPhone)
                            .font(.body)
                            .fontWeight(.heavy)
                    }
                }
                .padding()
                HStack {
                    VStack(alignment: .leading) {
                        Text("Twitter".uppercased())
                            .font(.caption)
                        Text(player.twitter)
                            .font(.body)
                            .fontWeight(.heavy)
                    }
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("Instagram".uppercased())
                            .font(.caption)
                        Text(player.instagram)
                            .font(.body)
                            .fontWeight(.heavy)
                    }
                }
                .padding()
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}

struct PlayerProfileView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerProfileView(player: dev.player)
    }
}
