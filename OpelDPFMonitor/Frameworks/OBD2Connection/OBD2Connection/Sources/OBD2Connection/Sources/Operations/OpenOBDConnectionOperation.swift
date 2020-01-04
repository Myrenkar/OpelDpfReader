import Foundation

class OpenOBDConnectionOperation: StreamHandleOperation {
    class func keyPathsForValuesAffectingIsFinished() -> Set<NSObject> {
        return ["inputOpen" as NSObject, "outOpen" as NSObject, "error" as NSObject]
    }
    
    class func keyPathsForValuesAffectingIsExecuting() -> Set<NSObject> {
        return ["inputOpen" as NSObject, "outOpen" as NSObject, "error" as NSObject]
    }
    
    private var inputOpen = false {
        didSet {
            if inputOpen {
                print("Input stream opened")
                input.remove(from: .current, forMode: .default)
            }
        }
    }
    
    private var outOpen = false {
        didSet {
            if outOpen {
                print("Output stream opened")
                output.remove(from: .current, forMode: .default)
            }
        }
    }
    
    override var isExecuting: Bool {
        let value = !(inputOpen && outOpen) && error == nil
        print("isExecuting \(value)")
        return value
    }
    
    override var isFinished: Bool {
        let value = (inputOpen && outOpen) || error != nil
        print("isFinished \(value)")
        return value
    }
    
    override func execute() {
        input.open()
        output.open()
    }
    
    override func inputStremEvent(event: Stream.Event) {
        if event == .openCompleted {
            inputOpen = true
        } else if event == .errorOccurred {
            print("Stream open error")
            error = input.streamError
        }
    }
    
    override func outputStremEvent(event: Stream.Event) {
        if event == .openCompleted {
            outOpen = true
        } else if event == .errorOccurred {
            print("Stream open error")
            error = output.streamError
        }
    }
}
