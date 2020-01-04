import Foundation

public class Mode09Descriptor: DescriptorProtocol {
    public var response: Response

    public required init(describe response: Response) {
        self.response = response
        self.mode = response.mode
    }

    public var mode: Mode

    public func VIN() -> String? {
        guard var data = response.data else { return nil }
        // remove \u{01}
        data.removeFirst()
        return String(data: data, encoding: String.Encoding.ascii)
    }
}
