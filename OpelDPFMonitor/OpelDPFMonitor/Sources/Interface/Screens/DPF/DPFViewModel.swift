import OBD2Connection
import Foundation
import Combine

protocol DPFViewModelProtocol {
    func connect()
}

final class DPFViewModel: DPFViewModelProtocol, ObservableObject {

    private let connection: OBD2Connection
    private  let observer = Observer<Command.Mode01>()

    init(connection: OBD2Connection = OBD2Connection()) {
        self.connection = connection
        observer.observe(command: .pid(number: 12)) { (descriptor) in
            let respStr = descriptor?.shortDescription
            print("Observer : \(String(describing: respStr))")
        }

        ObserverQueue.shared.register(observer: observer)

        connection.stateChanged = { (state) in
            OperationQueue.main.addOperation { [weak self] in
                self?.onOBD(change: state)
            }
        }

    }


    private func onOBD(change state: ScanState) {
        switch state {
            case .none:
                break
            case .connected:
                print("Connected")
            case .openingConnection:
                break
            case .initializing:
                break
        }
    }

    func getVin() {
        connection.request(command: Command.Mode09.vin) { (descriptor) in
            let respStr = descriptor?.VIN()
            print(respStr ?? "No value")
        }
    }

    func connect() {
        connection.connect {(success, error) in
            OperationQueue.main.addOperation({
                if let error = error {
                    print("OBD connection failed with \(error)")
                }
            })
        }
    }
}
