//
//  PlayerProfileViewModel.swift
//  Stat_Tracker_2022
//
//  Created by Michael Potts on 1/23/22.
//

import Foundation
import UIKit

class PlayerProfileViewModel: ObservableObject {
    @Published var player: PlayerProfile
    @Published var profileImage: UIImage? = LocalFileManager.instance.getImage(name: "profile")
    
    init() {
        if let url = profilePersistenceConstants.url, let autoSavedProfile = try? PlayerProfile(url: url) {
            player = autoSavedProfile
        } else {
            player = PlayerProfile()
        }
    }
    
    func saveImage() {
        LocalFileManager.instance.saveImage(image: profileImage!, name: "profile")
    }
    
    // update the player profile information
    func updateProfileInformation() {
        saveImage()
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
