import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            Form {
                Section() {
                    NavigationLink(destination: ConnectionSettingsView()) {
                        Text("settings_connection".localized)
                    }
                }

                Section(header: Text("settings_tutorial".localized)) {
                    Text("Go go go!")
                }
            }
            .navigationBarTitle(Text("settings_title".localized), displayMode: .large)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
