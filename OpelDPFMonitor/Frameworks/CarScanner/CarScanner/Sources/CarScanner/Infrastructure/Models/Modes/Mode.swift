import Foundation

public enum Mode: RawRepresentable {
    public typealias RawValue = UInt8

    case none
    case currentData01
    case freezeFrame02
    case diagnosticTroubleCodes03
    case resetTroubleCodes04
    case oxygenSensorMonitoringTestResults05 // CAN ONLY
    case requestOnboardMonitoringTestResultsForSMS06 // CAN ONLY
    case diagnosticTroubleCodesDetected07
    case controlOfOnboardComponent08
    case requestVehicleInfo09

    public init?(rawValue: RawValue) {
        switch rawValue {
            case 0x01:
                self = .currentData01
            case 0x02:
                self = .freezeFrame02
            case 0x03:
                self = .diagnosticTroubleCodes03
            case 0x04:
                self = .resetTroubleCodes04
            case 0x05: // CAN ONLY
                self = .oxygenSensorMonitoringTestResults05
            case 0x06: // CAN ONLY
                self = .requestOnboardMonitoringTestResultsForSMS06
            case 0x07:
                self = .diagnosticTroubleCodesDetected07
            case 0x08:
                self = .controlOfOnboardComponent08
            case 0x09:
                self = .requestVehicleInfo09
            default:
                self = .none
        }
    }

    public var rawValue: UInt8 {
        switch self {
            case .currentData01:
                return 0x01
            case .freezeFrame02:
                return 0x02
            case .diagnosticTroubleCodes03:
                return 0x03
            case .resetTroubleCodes04:
                return 0x04
            case .oxygenSensorMonitoringTestResults05:
                return 0x05
            case .requestOnboardMonitoringTestResultsForSMS06:
                return 0x06
            case .diagnosticTroubleCodesDetected07:
                return 0x07
            case .controlOfOnboardComponent08:
                return 0x08
            case .requestVehicleInfo09:
                return 0x09
            case .none:
                return 0x00
        }
    }
}
