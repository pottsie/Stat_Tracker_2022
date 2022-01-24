//
//  PersistenceConstants.swift
//  Stat_Tracker_2022
//
//  Created by Michael Potts on 1/24/22.
//

import Foundation

struct profilePersistenceConstants {
    static let profileFilename = "playerProfile.json"
    static var url: URL? {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        return documentDirectory?.appendingPathComponent(profileFilename)
    }
    static let coalescingInterval = 30.0
}

struct gamePersistenceConstants {
    static let gamesFilename = "games.json"
    static var url: URL? {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        return documentDirectory?.appendingPathComponent(gamesFilename)
    }
    static let coalescingInterval = 30.0
}

