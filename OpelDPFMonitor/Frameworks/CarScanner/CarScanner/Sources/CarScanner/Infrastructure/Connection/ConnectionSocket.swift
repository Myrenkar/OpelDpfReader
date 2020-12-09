import Foundation

public enum SocketState {
    case connected
    case error
}

protocol ConnectionSocketProtocol {
    var delegate: ConnectionSockerDelegate? { get set }

    func connect()
    func disconnect()
}

protocol ConnectionSockerDelegate: AnyObject {
    func response(_ socket: ConnectionSocketProtocol, response: String)
    func state(_ socket: ConnectionSocketProtocol, state: SocketState)
}

final class ConnectionSocket: NSObject, ConnectionSocketProtocol {
    private let host: String
    private let port: UInt32

    public init(host: String = "192.168.0.10", port: UInt32 = 35000) {
        self.host = host
        self.port = port
    }

    var inputStream: InputStream!
    var outputStream: OutputStream!

    weak var delegate: ConnectionSockerDelegate?

    func connect() {
        var readStream: Unmanaged<CFReadStream>?
        var writeStream: Unmanaged<CFWriteStream>?

        CFStreamCreatePairWithSocketToHost(kCFAllocatorDefault, host as CFString, port, &readStream, &writeStream)

        inputStream = readStream!.takeRetainedValue()
        outputStream = writeStream!.takeRetainedValue()

        [inputStream!, outputStream!].forEach {
            $0.delegate = self
            $0.schedule(in: .current, forMode: .common)
            $0.open()
        }
    }

    func disconnect() {
        [inputStream!, outputStream!].forEach { $0.close() }
    }
}

extension ConnectionSocket: StreamDelegate {
    func stream(_ aStream: Stream, handle eventCode: Stream.Event) {
        switch eventCode {
            case .errorOccurred:
                delegate?.state(self, state: .error)
            case .endEncountered:
                delegate?.state(self, state: .error)
            case Stream.Event.hasBytesAvailable:
                var buffer = [UInt8](repeating: 0, count: 4096)
                while inputStream.hasBytesAvailable {
                    let len = inputStream.read(&buffer, maxLength: buffer.count)
                    if len > 0 {
                        let output = NSString(bytes: &buffer, length: buffer.count, encoding: String.Encoding.ascii.rawValue)
                        delegate?.response(self, response: output! as String)
                    }
                }
            case Stream.Event.openCompleted:
                delegate?.state(self, state: .connected)
            default: break
        }
    }
}
