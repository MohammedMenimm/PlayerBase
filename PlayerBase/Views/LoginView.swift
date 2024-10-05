import SwiftUI

// MARK: - LoginView
struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var isLoggedIn = false // Tracks the login state

    var body: some View {
        if isLoggedIn {
            TeamListView() // Once logged in, show ContentView
        } else {
            VStack {
                Text("Login").font(.largeTitle).padding()

                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button(action: {
                    // For now, we'll allow login with any input
                    if username == "" && password == "" {
                        isLoggedIn = true
                    }
                }) {
                    Text("Login")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
            }
            .padding()
        }
    }
}
