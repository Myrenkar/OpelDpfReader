/import Foundation

public struct Response: Hashable, Equatable {
    var timestamp: Date
    var mode: Mode = .none
    var pid: UInt8 = 0
    var data: Data?
    var rawData: [UInt8] = []

    public var strigDescriptor: String?

    init() {
        self.timestamp = Date()
    }

    public var hashValue: Int {
        return Int(mode.rawValue ^ pid)
    }

    public static func ==(lhs: Response, rhs: Response) -> Bool {
        return false
    }

    public var hasData: Bool {
        return data == nil
    }
}
