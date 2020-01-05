import SwiftUI

struct DPFView: View {
    var body: some View {
        VStack {
            RadialView(title: "DPF")
            Divider()
            ConnectButton()
        }
    }
}

struct DPFView_Previews: PreviewProvider {
    static var previews: some View {
        DPFView()
    }
}
