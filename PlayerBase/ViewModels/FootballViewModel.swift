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
        request.setValue("", forHTTPHeaderField: "X-Auth-Token") // Set the token in the header

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

}
