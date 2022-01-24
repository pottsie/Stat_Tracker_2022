//
//  PlayerProfileView.swift
//  Stat_Tracker_2022
//
//  Created by Michael Potts on 1/23/22.
//

import SwiftUI

struct PlayerProfileView: View {
    @EnvironmentObject private var playerVM: PlayerProfileViewModel
//    let player: PlayerProfile
    @State var showProfileEditSheet: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                PlayerImageView(size: 200)
                
                soccerData
                
                contactData
                
                Spacer()
            }
            .navigationTitle(playerVM.player.name)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        // TODO: Define settings
                    } label: {
                        Label("Settings", systemImage: "gear")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showProfileEditSheet.toggle()
                    } label: {
                        Label("Edit profile", systemImage: "pencil")
                    }
                }
            }
            .sheet(isPresented: $showProfileEditSheet) {
                EditPlayerProfileView(player: $playerVM.player)
            }
        }
    }
    
    func contactDataView(label: String, value: String) -> some View {
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
        PlayerProfileView()
            .environmentObject(PlayerProfileViewModel())
    }
}

extension PlayerProfileView {
    
    var soccerData: some View {
        VStack {
            Text("#\(playerVM.player.jerseyNumber)")
            Text(playerVM.player.position)
            Text(playerVM.player.dateOfBirth.asString() + " (\(playerVM.player.ageGroup))")
        }
        .font(.title2)
        .foregroundColor(Color.theme.secondaryText)
        .padding(.bottom)

    }
    
    var contactData: some View {
        VStack {
            if let email = playerVM.player.email {
                contactDataView(label: "Email", value: email)
            }
            if let phone = playerVM.player.cellPhone {
                contactDataView(label: "Phone", value: phone)
            }
            if let twitter = playerVM.player.twitter {
                contactDataView(label: "Twitter", value: twitter)
            }
            if let instagram = playerVM.player.instagram {
                contactDataView(label: "Instagram", value: instagram)
            }
        }
    }
}
