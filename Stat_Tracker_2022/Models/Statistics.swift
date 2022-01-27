//
//  Statistics.swift
//  Stat_Tracker_2022
//
//  Created by Michael Potts on 1/23/22.
//

import Foundation

struct Statistics: Codable {
    
//    let id: String
    var minutesPlayed: Int
    var goals: Int
    var assists: Int
    var shots: Int
    var shotsOnGoal: Int
    var passAttempts: Int
    var passCompletions: Int
    var blocks: Int
    var clearances: Int
    var interceptions: Int
    // stats for goalie?
//    let saves: Int
//    let shotsFaced: Int
    
    init() {
        minutesPlayed = 80
        goals = 0
        assists = 0
        shots = 0
        shotsOnGoal = 0
        passAttempts = 0
        passCompletions = 0
        blocks = 0
        clearances = 0
        interceptions = 0
    }
    
    init(minutesPlayed: Int, goals: Int, assists: Int, shots: Int, shotsOnGoal: Int, passAtt: Int, passComp: Int, blocks: Int, clearances: Int, interceptions: Int) {
        self.minutesPlayed = minutesPlayed
        self.goals = goals
        self.assists = assists
        self.shots = shots
        self.shotsOnGoal = shotsOnGoal
        self.passAttempts = passAtt
        self.passCompletions = passComp
        self.blocks = blocks
        self.clearances = clearances
        self.interceptions = interceptions

    }
    
    var passPercentage: Double {
        if passAttempts > 0 {
            return Double(passCompletions) / Double(passAttempts)
        } else {
            return 0.0
        }
    }
    
    var shotsOnTarget: Double {
        return Double(shotsOnGoal) / Double(shots)
    }
    
//    var savePercentage: Double {
//        return Double(saves) / Double(shotsFaced)
//    }
    
}
