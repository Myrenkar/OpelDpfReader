import Foundation

public class StringDescriptor: DescriptorProtocol {
    public var response: Response

    public required init(describe response: Response) {
        self.response = response
        self.mode = response.mode
    }

    public var mode: Mode

    public func getResponse() -> String? {
        guard let data = response.data else { return nil }
        return String(data: data, encoding: .ascii)
    }
}
