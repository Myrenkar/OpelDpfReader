import SwiftUI

struct DPFView: View {
    var body: some View {
        VStack {
            HStack {
                RadialView(title: "EGR")
                RadialView(title: "WTF")
            }
            RadialView(title: "DPF")
            Spacer()
            ConnectButton()
        }
    }
}

struct DPFView_Previews: PreviewProvider {
    static var previews: some View {
        DPFView()
    }
}
