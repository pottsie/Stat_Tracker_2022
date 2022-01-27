//
//  PreviewProvider.swift
//  Stat_Tracker_2022
//
//  Created by Michael Potts on 1/23/22.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() { }
    
    // Define example PlayerProfile and Game data below
    let player = PlayerProfile()
//        id: UUID().uuidString,
//        name: "Michael Potts",
//        position: "Goalkeeper",
//        isGoalie: false,
//        jerseyNumber: "4",
//        dateOfBirth: Date("2007-01-05"),
//        ageGroup: "U-15",
//        team: "The All-Stars",
//        email: "pottsma@me.com",
//        cellPhone: "571-255-0187",
//        twitter: nil,
//        instagram: "@mapottsie")
    
    let game = Game(
        opponent: "Arlington Blue 2007B",
        dateOfGame: Date("2022-01-02"),
        ourScore: 3,
        opponentScore: 1,
        notes: "This was a great game defensively. Has 2 good shots.",
        isFutsal: true,
        statistics: Statistics(
            minutesPlayed: 65,
            goals: 1,
            assists: 1,
            shots: 3,
            shotsOnGoal: 1,
            passAtt: 7,
            passComp: 6,
            blocks: 1,
            clearances: 2,
            interceptions: 3))
}
