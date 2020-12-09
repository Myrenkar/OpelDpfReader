import Foundation

protocol StreamWriting {
    func write(data: Data) throws
}

final class StreamWriter: StreamWriting {
    private let stream: OutputStream

    init(stream: OutputStream) {
        self.stream = stream
    }

    func write(data: Data) throws {
        print("Write to OBD \(String(describing: String(data: data, encoding: .ascii)))")

        _ = try data.withUnsafeBytes {
            guard let pointer = $0.baseAddress?.assumingMemoryBound(to: UInt8.self) else {
                print("Error joining chat")
                throw StreamError.writingError
            }
            stream.write(pointer, maxLength: data.count)
        }
    }
}

enum StreamError: Error {
    case writingError
}
