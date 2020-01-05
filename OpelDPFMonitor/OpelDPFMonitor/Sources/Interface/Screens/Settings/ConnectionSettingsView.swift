import SwiftUI

struct ConnectionSettingsView: View {

    @State private var host: String = "http://192.168.0.10"
    @State private var port: String = "35000"

    var body: some View {
        Form {
            Section(header: Text("Host")) {
                TextField("Enter your host", text: $host)
            }

            Section(header: Text("Port")) {
                TextField("Enter your port", text: $port)
            }
        }
    }
}

struct ConnectionSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectionSettingsView()
    }
}
