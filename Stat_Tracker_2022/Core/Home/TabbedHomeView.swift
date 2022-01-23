//
//  TabbedHomeView.swift
//  Stat_Tracker_2022
//
//  Created by Michael Potts on 1/23/22.
//

import SwiftUI

struct TabbedHomeView: View {
    var body: some View {
        TabView {
//            PlayerProfileView(player: )
            Text("Player Profile")
                .tabItem {
                    Label("Player Profile", systemImage: "person.crop.square")
                }
            Text("Games")
                .tabItem {
                    Label("Games", systemImage: "list.bullet")
                }
            Text("Stats")
                .tabItem {
                    Label("Stats", systemImage: "chart.bar")
                }
        }
    }
}

struct TabbedHomeView_Previews: PreviewProvider {
    static var previews: some View {
        TabbedHomeView()
    }
}