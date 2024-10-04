// Views/PlayerRow.swift
import SwiftUI

struct PlayerRow: View {
    let player: FootballPlayer

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(player.name)
                    .font(.headline)
                Text(player.position)
                    .font(.subheadline)
                Text(player.marketValue)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding()
    }
}
