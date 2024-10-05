import Foundation

struct TeamsResponse: Codable {
    let count: Int
    let filters: Filters // Add a Filters struct to decode the filters
    let teams: [FootballTeam]
}

struct Filters: Codable {
    let limit: Int
    let offset: Int
    let permission: String
}
