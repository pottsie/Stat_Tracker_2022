//
//  PlayerProfileViewModel.swift
//  Stat_Tracker_2022
//
//  Created by Michael Potts on 1/23/22.
//

import Foundation

class PlayerProfileViewModel: ObservableObject {
    @Published var player: PlayerProfile
    
    init() {
        if let url = profilePersistenceConstants.url, let autoSavedProfile = try? PlayerProfile(url: url) {
            player = autoSavedProfile
        } else {
            player = PlayerProfile()
        }
    }
    
    // update the player profile information
    func updateProfileInformation() {
//        if email.isEmpty {
//            player.email = ""
//        } else {
//            player.email = email
//        }
//        if cellPhone.isEmpty {
//            player.cellPhone = ""
//        } else {
//            player.cellPhone = cellPhone
//        }
//        if twitter.isEmpty {
//            player.twitter = ""
//        } else {
//            player.twitter = twitter
//        }
//        if instagram.isEmpty {
//            player.instagram = ""
//        } else {
//            player.instagram = instagram
//        }
        
        autoSave()
    }
    
    func autoSave() {
        print("Saving Data...")
        let thisFunction = "\(String(describing: self)).\(#function)"
        do {
            let data = try player.json()
            try data.write(to: profilePersistenceConstants.url!)
        } catch let encodingError where encodingError is EncodingError {
            print("\(thisFunction) error = \(encodingError)")
        } catch {
            print("\(thisFunction) error = \(error)")
        }
    }
    
}
