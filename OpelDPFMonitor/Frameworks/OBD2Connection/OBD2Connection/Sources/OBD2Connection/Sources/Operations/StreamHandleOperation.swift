import Foundation

class StreamHandleOperation: Operation, StreamDelegate {
    private(set) var input: InputStream
    private(set) var output: OutputStream

    var error: Error? {
        didSet {
            input.remove(from: .current, forMode: .default)
            output.remove(from: .current, forMode: .default)
        }
    }

    init(inputStream: InputStream, outputStream: OutputStream) {
        self.input = inputStream
        self.output = outputStream
        super.init()
    }

    override func main() {
        super.main()

        if isCancelled {
            return
        }

        input.delegate = self
        output.delegate = self

        input.schedule(in: .current, forMode: .default)
        output.schedule(in: .current, forMode: .default)
        execute()
        RunLoop.current.run()
    }

    func execute() {}

    func stream(_ aStream: Stream, handle eventCode: Stream.Event) {
        if aStream == input {
            inputStremEvent(event: eventCode)
        } else if aStream == output {
            outputStremEvent(event: eventCode)
        }
        if eventCode == .errorOccurred {
            error = aStream.streamError
        }
    }

    func inputStremEvent(event: Stream.Event) {}

    func outputStremEvent(event: Stream.Event) {}
}
