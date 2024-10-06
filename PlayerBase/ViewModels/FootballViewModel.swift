import SwiftUI
import Combine

class FootballViewModel: ObservableObject {
    @Published var teams: [FootballTeam] = [] // Ensure this matches the correct model

    func fetchFootballTeams() {
        fetchBundesligaTeams { [weak self] teams in
            DispatchQueue.main.async {
                self?.teams = teams ?? [] // Update teams on the main thread
            }
        }
    }

    func fetchBundesligaTeams(completion: @escaping ([FootballTeam]?) -> Void) {
        let urlString = "https://api.football-data.org/v4/teams"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            completion(nil)
            return
        }

        var request = URLRequest(url: url)
        request.setValue("b970f815f0154086813c866d2f1933ee", forHTTPHeaderField: "X-Auth-Token") // Set the token in the header

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                completion(nil)
                return
            }

            guard let data = data else {
                print("No data returned")
                completion(nil)
                return
            }

            do {
                let decoder = JSONDecoder()
                let teamsResponse = try decoder.decode(TeamsResponse.self, from: data)
                completion(teamsResponse.teams)
            } catch {
                print("Error decoding JSON: \(error)")
                completion(nil)
            }
        }
        task.resume()
    }
    
    @Published var standings: [TeamStanding] = []

            func fetchStandings(for season: String) {
                guard let url = URL(string: "https://api.football-data.org/v4/competitions/BL1/standings") else {
                    print("Invalid URL")
                    return
                }

                var request = URLRequest(url: url)
                request.setValue("b970f815f0154086813c866d2f1933ee", forHTTPHeaderField: "X-Auth-Token")

                URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
                    if let error = error {
                        print("Error fetching standings: \(error.localizedDescription)")
                        return
                    }

                    guard let data = data else {
                        print("No data received")
                        return
                    }

                    do {
                        let standingsResponse = try JSONDecoder().decode(StandingsResponse.self, from: data)

                        // Update the standings on the main thread
                        DispatchQueue.main.async {
                            self?.standings = standingsResponse.standings.flatMap { $0.table } // Assuming you want to flatten the tables
                        }
                    } catch {
                        print("Error decoding JSON: \(error)")
                    }
                }.resume()
            }

}
