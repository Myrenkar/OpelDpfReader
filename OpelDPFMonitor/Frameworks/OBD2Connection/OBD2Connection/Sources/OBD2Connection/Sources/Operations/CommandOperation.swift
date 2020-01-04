import Foundation

class CommandOperation: StreamHandleOperation {
    class func keyPathsForValuesAffectingIsFinished() -> Set<NSObject> {
        return ["readCompleted" as NSObject, "error" as NSObject]
    }

    private(set) var command: DataRequest
    private(set) var reader: StreamReader
    private var readCompleted = false {
        didSet {
            input.remove(from: .current, forMode: RunLoop.Mode.default)
            output.remove(from: .current, forMode: RunLoop.Mode.default)
        }
    }

    var onReceiveResponse: ((_ response: Response) -> ())?

    init(inputStream: InputStream, outputStream: OutputStream, command: DataRequest) {
        self.command = command
        self.reader = StreamReader(stream: inputStream)
        super.init(inputStream: inputStream, outputStream: outputStream)
    }

    override var isFinished: Bool {
        if error != nil {
            return true
        }
        return readCompleted
    }

    override func execute() {
        guard let data = command.data else { return }
        let writer = StreamWriter(stream: output, data: data)
        do {
            try writer.write()
        } catch {
            print("Error \(error) on data writing")
            self.error = InitializationError.DataWriteError
        }
    }

    override func inputStremEvent(event: Stream.Event) {
        if event == .hasBytesAvailable {
            do {
                if try reader.read() {
                    onReadEnd()
                }
            } catch {
                self.error = error
            }
        }
    }

    private func onReadEnd() {
        let package = Package(buffer: reader.readBuffer, length: reader.readBufferLenght)
        let response = Parser.package.read(package: package)
        onReceiveResponse?(response)
        readCompleted = true
    }
}
