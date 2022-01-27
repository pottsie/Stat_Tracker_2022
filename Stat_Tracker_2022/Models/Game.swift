//
//  Game.swift
//  Stat_Tracker_2022
//
//  Created by Michael Potts on 1/23/22.
//

import Foundation

struct Game: Identifiable, Codable {
    
    var id: String = UUID().uuidString
    var opponent: String
    var dateOfGame: Date
    var ourScore: Int
    var opponentScore: Int
    var notes: String
    var isFutsal: Bool
    var statistics: Statistics
    
    init() {
        opponent = ""
        dateOfGame = Date()
        ourScore = 0
        opponentScore = 0
        notes = "Game notes"
        isFutsal = false
        statistics = Statistics()
    }
    
    init(opponent: String, dateOfGame: Date, ourScore: Int, opponentScore: Int, notes: String, isFutsal: Bool, statistics: Statistics) {
        self.opponent = opponent
        self.dateOfGame = dateOfGame
        self.ourScore = ourScore
        self.opponentScore = opponentScore
        self.notes = notes
        self.isFutsal = isFutsal
        self.statistics = statistics
    }
    
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
