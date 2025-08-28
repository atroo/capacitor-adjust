import Foundation
import AdjustSdk

@objc public class AdjustImpl: NSObject {    
    @objc public func initAdjust(appToken: String, environment: String, logLevel: String) {
        let adjustConfig = ADJConfig(appToken: appToken, environment: environment)
        Adjust.initSdk(adjustConfig)
    }

}
