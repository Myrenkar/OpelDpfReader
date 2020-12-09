public struct Command {}

extension Command {
    public enum AT: RawRepresentable {

        public init?(rawValue: String) {
            switch rawValue {
                case "WS": self = .reset
                case "H1": self = .header(true)
                case "H0": self = .header(false)
                case "EO": self = .echo(false)
                case "E1": self = .echo(true)
                case "RV": self = .voltage
                case "DP": self = .protocol
                case "DPN": self = .protocolNumber
                case "I": self = .versionId
                case "@1": self = .deviceDescription
                case "@2": self = .readDeviceIdentifier
                default: self = .other(rawValue)
            }
        }

        case reset
        case header(Bool)
        case echo(Bool)
        case voltage
        case `protocol`
        case protocolNumber
        case versionId
        case deviceDescription
        case readDeviceIdentifier
        case setDeviceIdentifier(String)
        case other(String)

        public var rawValue: String {
            switch self {
                case .reset:
                    return "WS"
                case let .header(bool):
                    if bool == true {
                        return "H1"
                    } else {
                        return "H0"
                }
                case let .echo(bool):
                    if bool == true {
                        return "E1"
                    } else {
                        return "E0"
                }
                case .voltage:
                    return "RV"
                case .`protocol`:
                    return "DP"
                case .protocolNumber:
                    return "DPN"
                case .versionId:
                    return "I"
                case .deviceDescription:
                    return "@1"
                case .readDeviceIdentifier:
                    return "@2"
                case .setDeviceIdentifier(let identifier):
                    return "@2 " + identifier
                case .other(let command):
                    return command
            }
        }
    }
}

extension Command {
    public enum CAN: RawRepresentable {
        public init?(rawValue: String) {
            self = .custom(rawValue)
        }

        case custom(String)

        public var rawValue: String {
            switch self {
                case .custom(let data):
                    return data
            }
        }
    }

}
