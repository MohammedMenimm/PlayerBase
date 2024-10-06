//
//  StandingsView.swift
//  PlayerBase
//
//  Created by Mohammed Menim on 2024-10-06.
//

import Foundation
import SwiftUI

struct StandingsView: View {
    @ObservedObject var viewModel = FootballViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.standings) { standing in
                HStack {
                    Text("\(standing.position)") // Position
                        .fontWeight(.bold)
                    AsyncImage(url: URL(string: standing.team.crest)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                    } placeholder: {
                        ProgressView()
                    }
                    Text(standing.team.name) // Team Name
                    Spacer()
                    Text("\(standing.points)") // Points
                }
            }
            .navigationTitle("Bundesliga Standings")
            .onAppear {
                viewModel.fetchStandings(for: "2023") // Fetch standings for the current season
            }
        }
    }
}
