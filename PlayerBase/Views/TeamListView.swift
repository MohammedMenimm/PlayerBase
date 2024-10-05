import SwiftUI

struct TeamListView: View {
    @ObservedObject var viewModel = FootballViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.teams) { team in
                HStack {
                    // Show team crest
                    AsyncImage(url: URL(string: team.crest)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle()) // Optional: makes the image circular
                    } placeholder: {
                        ProgressView() // Show a progress view while the image loads
                    }
                    Text(team.name)
                        .font(.headline) // Optional: format the team name
                        .padding(.leading, 8) // Optional: add some padding
                }
            }
            .navigationTitle("Football Teams")
            .onAppear {
                viewModel.fetchFootballTeams()
            }
        }
    }
}
