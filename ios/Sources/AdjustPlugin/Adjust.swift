import Foundation

@objc public class Adjust: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
}
