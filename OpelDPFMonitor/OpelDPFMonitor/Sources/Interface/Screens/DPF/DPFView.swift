import SwiftUI
import Combine

struct DPFView: View {

    @ObservedObject var model = DPFViewModel()

    var body: some View {
        VStack {
            RadialView(title: "DPF")
            Divider()
            Button(action: {
                self.model.connect()
            }) {
                Text("dpf_button_connect".localized)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .font(.title)
                    .cornerRadius(20)
            }
            Divider()

            Button(action: {
                self.model.getVin()
            }) {
                Text("Bledy")
                .padding()
            }
        }
    }
}

struct DPFView_Previews: PreviewProvider {
    static var previews: some View {
        DPFView()
    }
}
