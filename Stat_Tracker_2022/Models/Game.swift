//
//  Game.swift
//  Stat_Tracker_2022
//
//  Created by Michael Potts on 1/23/22.
//

import Foundation

struct Game: Identifiable {
    
    let id: String = UUID().uuidString
    let opponent: String
    let dateOfGame: Date
    let ourScore: Int
    let opponentScore: Int
    let notes: String
    let isFutsal: Bool
    let statistics: Statistics
    
    var gameResult: String {
        if ourScore > opponentScore {
            return "W \(ourScore)-\(opponentScore)"
        } else if ourScore < opponentScore {
            return "L \(ourScore)-\(opponentScore)"
        } else {
            return "T \(ourScore)-\(opponentScore)"
        }
    }
    
}
