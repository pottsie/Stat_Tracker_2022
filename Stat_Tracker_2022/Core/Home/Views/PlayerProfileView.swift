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
    @State var showSettingsView: Bool = false
    
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
                        showSettingsView.toggle()
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
            .sheet(isPresented: $showSettingsView) {
                SettingsView()
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
            if !playerVM.player.email.isEmpty {
                contactDataView(label: "Email", value: playerVM.player.email)
            }
            if !playerVM.player.cellPhone.isEmpty {
                contactDataView(label: "Phone", value: playerVM.player.cellPhone)
            }
            if !playerVM.player.twitter.isEmpty {
                contactDataView(label: "Twitter", value: playerVM.player.twitter)
            }
            if !playerVM.player.instagram.isEmpty {
                contactDataView(label: "Instagram", value: playerVM.player.instagram)
            }
        }
    }
}
