//
//  GameViewModel.swift
//  Stat_Tracker_2022
//
//  Created by Michael Potts on 1/23/22.
//

import Foundation

class GameViewModel: ObservableObject {
    @Published var games: [Game]
    @Published var filter: GameType
    
    init() {
        self.filter = .all
        if LocalFileManager.instance.loadGames() == nil {
            print("INITIALIZING NEW ARRAY")
            self.games = []
        } else {
            print("LOADING GAMES FROM FILE")
            self.games = LocalFileManager.instance.loadGames()!
        }
    }
    
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
    
    // MARK: User intents
    
    func deleteGame(indices: IndexSet) {
        games.remove(atOffsets: indices)
        saveGames()
    }
    
    func addGame(game: Game) {
        games.append(game)
        print("SAVING GAMES")
        saveGames()
    }
    
    func saveGames() {
        LocalFileManager.instance.saveGames(games: games)
    }
}
