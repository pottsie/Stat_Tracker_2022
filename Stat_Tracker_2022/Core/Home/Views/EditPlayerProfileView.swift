//
//  EditPlayerProfileView.swift
//  Stat_Tracker_2022
//
//  Created by Michael Potts on 1/24/22.
//

import SwiftUI

struct EditPlayerProfileView: View {
    @Binding var player: PlayerProfile
    @EnvironmentObject private var playerVM: PlayerProfileViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            HStack {
            PlayerImageView(size: 100)
                // add onTapGesture to image and then add functionality for picking an image
                // from the users photo library
                Text("Tap image to choose a new profile picture.")
                    .foregroundColor(Color.theme.secondaryText)
                    .italic()
                    .multilineTextAlignment(.center)
            }
            Form {
                Section {
                    TextField("Name", text: $player.name)
                    TextField("Position", text: $player.position)
                    TextField("Jersey number", text: $player.jerseyNumber)
                        .keyboardType(.numberPad)
                    DatePicker("Date of Birth",
                               selection: $player.dateOfBirth,
                               in: ...Date(),
                               displayedComponents: [.date]
                    )
                    TextField("Team", text: $player.team)
                    TextField("Age group", text: $player.ageGroup)
                    Toggle("Goalie?", isOn: $player.isGoalie)

                } header: {
                    Text("Soccer Data")
                }
                Section {
                    TextField("Email", text: $player.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                    TextField("Phone", text: $player.cellPhone)
                    TextField("Twitter", text: $player.twitter)
                        .textInputAutocapitalization(.never)
                    TextField("Instagram", text: $player.instagram)
                        .textInputAutocapitalization(.never)

                } header: {
                    Text("Contact Data (Optional)")
                }
            }
            
            // move buttons out of main view, create a view modified for the button style
            HStack {
                Spacer()
                Button {
                    playerVM.updateProfileInformation()
                    // View Model needs to
                    // process contact data to String?, if necessary
                    // save profile data

                    dismiss()
                } label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .bold()
                        .frame(width: 120, height: 40)
                        .background(Color.green)
                        .cornerRadius(10)
                }
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Text("Cancel".uppercased())
                        .foregroundColor(.white)
                        .bold()
                        .frame(width: 120, height: 40)
                        .background(Color.red)
                        .cornerRadius(10)
                }
                Spacer()
            }
            Spacer()
        }
    }
}

struct EditPlayerProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditPlayerProfileView(player: .constant(dev.player))
            .environmentObject(PlayerProfileViewModel())
            
    }
}
