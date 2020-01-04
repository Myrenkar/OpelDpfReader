/import Foundation

public protocol DescriptorProtocol {
    var response: Response { get set }
    var mode: Mode { get set }
    var hasData: Bool { get }
    init(describe response: Response)
}

extension DescriptorProtocol {
    public var hasData: Bool {
        return response.hasData
    }
}

protocol PidDataHandler {
    associatedtype DataType
    var data: Data! { get }
    func handle() -> DataType
}

class FuelSystemStatus: PidDataHandler {
    typealias DataType = String
    var data: Data!

    func handle() -> String {
        var rvString: String = ""
        let dataA = data[0]

        switch dataA {
        case 0x01:
            rvString = "Open Loop"
        case 0x02:
            rvString = "Closed Loop"
        case 0x04:
            rvString = "OL-Drive"
        case 0x08:
            rvString = "OL-Fault"
        case 0x10:
            rvString = "CL-Fault"
        default:
            break
        }
        return rvString
    }
}
