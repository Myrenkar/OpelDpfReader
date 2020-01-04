import Foundation

public extension Command {
    enum Mode03: CommandType {
        public typealias Descriptor = Mode03Descriptor

        public var hashValue: Int {
            return Int(mode.rawValue) ^ 0
        }

        public static func == (lhs: Mode03, rhs: Mode03) -> Bool {
            return lhs.hashValue == rhs.hashValue
        }

        case troubleCode

        public var mode: Mode {
            return .DiagnosticTroubleCodes03
        }

        public var dataRequest: DataRequest {
            return DataRequest(from: "03")
        }
    }
}
