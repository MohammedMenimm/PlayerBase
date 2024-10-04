// ContentView.swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(players, id: \.name) { player in
                PlayerRow(player: player)
            }
            .navigationTitle("Football Players")
        }
    }
}

#Preview {
    ContentView()
}
