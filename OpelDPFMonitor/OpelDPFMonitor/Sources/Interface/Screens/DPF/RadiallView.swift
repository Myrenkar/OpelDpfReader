import SwiftUI


struct RadialView: View {
    let title: String

    @State var percent: Double = 0.99

    var body: some View {
        let colors = Gradient(colors: [.green, .red])
        let gradient = AngularGradient(gradient: colors, center: .center, startAngle: .zero, endAngle: .degrees(360 * percent))

        return
            VStack {
                Text(title)
                ZStack {
                    ArcShape(percent: percent)
                        .stroke(gradient, lineWidth: 20)
                        .rotationEffect(.degrees(-90))
                        .aspectRatio(1, contentMode: .fit)
                        .onAppear() {
                            self.animate(value: self.percent)
                        }
                        .padding(20)
                        .drawingGroup()

                    Text("\(percent * 100, specifier: "%.2f") %")
                        .font(.system(size: 25))
                        .frame(width: nil, height: nil, alignment: .center)
                }
        }
    }
}

extension RadialView {
    var circleAnimation: Animation {
           return Animation.default
       }

    func animate(value: Double) {
        withAnimation(circleAnimation) {
            percent = value
        }
    }
}

private struct ArcShape: Shape {
    var percent: Double

    func path(in rect: CGRect) -> Path {
        let end = percent * 360
        var p = Path()

        // 2
        p.addArc(center: CGPoint(x: rect.size.width/2, y: rect.size.width/2),
                 radius: rect.size.width/2,
                 startAngle: Angle(degrees: 0),
                 endAngle: Angle(degrees: end),
                 clockwise: false)
        return p
    }

    var animatableData: Double {
        get { return percent }
        set { percent = newValue }
    }
}

struct RadialView_Previews: PreviewProvider {
    static var previews: some View {
        RadialView(title: "DPF")
    }
}
