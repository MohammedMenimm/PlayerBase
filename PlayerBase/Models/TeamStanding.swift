import Foundation

struct TeamStanding: Codable, Identifiable {
    var id: Int { team.id } // Use the team's unique ID as the SwiftUI identifier
    
    let position: Int
    let team: TeamInfo
    let playedGames: Int
    let form: String? // Optional since it can be null
    let won: Int
    let drawn: Int
    let lost: Int
    let points: Int
    let goalsFor: Int
    let goalsAgainst: Int
    let goalDifference: Int
    
    struct TeamInfo: Codable {
        let id: Int
        let name: String
        let shortName: String
        let tla: String
        let crest: String
    }
}
