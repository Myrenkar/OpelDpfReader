import SwiftUI

struct ConnectButton: View {

    @State private var isAnimating: Bool = false

    var body: some View {
        ZStack {
            Button(action: {
                self.animateAction()
            }) {
                Text("dpf_button_connect".localized)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .font(.title)
                .cornerRadius(20)
            }
            .animation(Animation.easeIn(duration: 0.5), value: isAnimating)
        }
    }

    private func animateAction() {
        isAnimating = true
    }
}

struct ConnectButton_Previews: PreviewProvider {
    static var previews: some View {
        ConnectButton()
    }
}
