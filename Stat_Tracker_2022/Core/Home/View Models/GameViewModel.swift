//
//  GameViewModel.swift
//  Stat_Tracker_2022
//
//  Created by Michael Potts on 1/23/22.
//

import Foundation

class GameViewModel: ObservableObject {
    @Published var games: [Game] = []
    @Published var filter: GameType = .all
    
    func filteredGameList() -> [Game] {
        switch filter {
        case .all:
            return games
        case .futsal:
            return games.filter { $0.isFutsal}
        case .outdoor:
            return games.filter { !$0.isFutsal}
        }
    }
    
}
