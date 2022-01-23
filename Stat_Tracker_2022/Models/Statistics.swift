//
//  Statistics.swift
//  Stat_Tracker_2022
//
//  Created by Michael Potts on 1/23/22.
//

import Foundation

struct Statistics {
    
    let goals: Int
    let assists: Int
    let shots: Int
    let shotsOnGoal: Int
    let passAttempts: Int
    let passCompletions: Int
    let blocks: Int
    let clearances: Int
    let interceptions: Int
    // stats for goalie?
//    let saves: Int
//    let shotsFaced: Int
    
    var passPercentage: Double {
        return Double(passCompletions) / Double(passAttempts) * 100.0
    }
    
    var shotsOnTarget: Double {
        return Double(shotsOnGoal) / Double(shots) * 100.0
    }
    
//    var savePercentage: Double {
//        return Double(saves) / Double(shotsFaced) * 100.0
//    }
    
}
