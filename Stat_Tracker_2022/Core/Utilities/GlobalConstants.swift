//
//  GlobalConstants.swift
//  Stat_Tracker_2022
//
//  Created by Michael Potts on 1/23/22.
//

import Foundation

enum GameType: String, CaseIterable {
    case all
    case futsal
    case outdoor
}

struct SoccerData {
    
    // Length of game -> used in normalizing statistics
    // Value varies based on Age Group
    var outdoorGameLength: Double = 80.0
    
}
