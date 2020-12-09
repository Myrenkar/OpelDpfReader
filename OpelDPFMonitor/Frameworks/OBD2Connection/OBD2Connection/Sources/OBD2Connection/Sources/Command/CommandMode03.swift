import Foundation

public extension Command {
    enum Mode03: CommandType {
        public typealias Descriptor = Mode03Descriptor

        case troubleCode

        public var mode: Mode {
            return .DiagnosticTroubleCodes03
        }

        public var dataRequest: DataRequest {
            return DataRequest(from: "03")
        }
    }
}
