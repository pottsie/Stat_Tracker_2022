//
//  Stat_Tracker_2022App.swift
//  Stat_Tracker_2022
//
//  Created by Michael Potts on 1/23/22.
//

import SwiftUI

@main
struct Stat_Tracker_2022App: App {
    @StateObject var playerVM: PlayerProfileViewModel = PlayerProfileViewModel()
    @StateObject var gameVM: GameViewModel = GameViewModel()

    var body: some Scene {
        WindowGroup {
            TabbedHomeView()
                .environmentObject(playerVM)
                .environmentObject(gameVM)
        }
    }
}
