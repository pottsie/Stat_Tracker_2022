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
    @State var showPhotoPicker: Bool = false
    
    var body: some View {
        VStack {
            imageSelectionSection
                .sheet(isPresented: $showPhotoPicker) {
                    PhotoPicker(profileImage: $playerVM.profileImage)
                }
            Form {
                soccerDataSection
                contactDataSection
                buttonSection
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

extension EditPlayerProfileView {
    var buttonSection: some View {
        Section {
            Button {
                playerVM.updateProfileInformation()
                dismiss()
            } label: {
                Text("Save Changes")
            }
            Button(role: .destructive) {
                dismiss()
            } label: {
                Text("Cancel and Discard Changes")
            }
        }
    }
    
    var imageSelectionSection: some View {
        HStack {
            PlayerImageView(size: 100)
                .onTapGesture {
                    showPhotoPicker.toggle()
                }
            Text("Tap image to choose a new profile picture.")
                .foregroundColor(Color.theme.secondaryText)
                .italic()
                .multilineTextAlignment(.center)
        }
    }
    
    var soccerDataSection: some View {
        Section {
            TextField("Name", text: $player.name)
                .submitLabel(.next)
                .textInputAutocapitalization(.words)
            TextField("Position", text: $player.position)
                .submitLabel(.next)
                .textInputAutocapitalization(.words)
            TextField("Jersey number", text: $player.jerseyNumber)
                .keyboardType(.numbersAndPunctuation)
                .submitLabel(.next)

            DatePicker("Date of Birth",
                       selection: $player.dateOfBirth,
                       in: ...Date(),
                       displayedComponents: [.date]
            )
            TextField("Team", text: $player.team)
                .submitLabel(.next)
            TextField("Age group", text: $player.ageGroup)
                .submitLabel(.next)
            Toggle("Goalie?", isOn: $player.isGoalie)

        } header: {
            Text("Soccer Data")
        }
    }
    
    var contactDataSection: some View {
        Section {
            TextField("Email", text: $player.email)
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)
                .submitLabel(.next)

            TextField("Phone", text: $player.cellPhone)
                .submitLabel(.next)
                .keyboardType(.numbersAndPunctuation)

            TextField("@Twitter", text: $player.twitter)
                .submitLabel(.next)
                .textInputAutocapitalization(.never)
                .keyboardType(.twitter)
            
            TextField("Instagram", text: $player.instagram)
                .submitLabel(.done)
                .textInputAutocapitalization(.never)

        } header: {
            Text("Contact Data (Leave blank if none)")
        }
    }
}
