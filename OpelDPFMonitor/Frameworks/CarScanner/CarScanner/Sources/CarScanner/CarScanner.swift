import Foundation

protocol CarScanning {
    func connect()
}

public class CarScanner: CarScanning {

    private var connection: ConnectionSocketProtocol
    private let queue: DispatchQueue

    public convenience init() {
        self.init(socket: ConnectionSocket())
    }

    init(socket: ConnectionSocketProtocol) {
        self.connection = socket
        self.queue = DispatchQueue(label: "com.smartapps.OBDIIScanner.RequestQueue")
    }

    public func connect() {
        connection.connect()
        connection.delegate = self
    }

    public func disconnect() {
        connection.disconnect()
    }

    public func request() {

    }
}

extension CarScanner: ConnectionSockerDelegate {
    func response(_ socket: ConnectionSocketProtocol, response: String) {

    }

    func state(_ socket: ConnectionSocketProtocol, state: SocketState) {

    }
}
