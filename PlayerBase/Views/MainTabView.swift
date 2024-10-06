//
//  MainTabView.swift
//  PlayerBase
//
//  Created by Mohammed Menim on 2024-10-06.
//

import Foundation
import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            TeamListView()
                .tabItem {
                    Image(systemName: "list.dash") // Choose an appropriate icon
                    Text("Teams")
                }
            
            StandingsView()
                .tabItem {
                    Image(systemName: "star") // Choose an appropriate icon
                    Text("Standings")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
