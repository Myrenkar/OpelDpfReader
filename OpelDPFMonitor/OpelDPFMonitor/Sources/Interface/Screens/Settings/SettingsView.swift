import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Aaaa")) {
                    Text("Witam")
                }

                Section {
                    Text("Połączenie")
                }
            }
            .navigationBarTitle("Ustawienia", displayMode: .large)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
