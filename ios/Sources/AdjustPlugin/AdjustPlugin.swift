import Foundation
import Capacitor
import AdjustSdk

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(AdjustPlugin)
public class AdjustPlugin: CAPPlugin, CAPBridgedPlugin {
    public let identifier = "AdjustPlugin"
    public let jsName = "Adjust"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "initAdjust", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "trackEvent", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "getAdid", returnType: CAPPluginReturnPromise)
    ]
    private let implementation = AdjustImpl()

    @objc func initAdjust(_ call: CAPPluginCall) {
        let appToken = call.getString("appToken") ?? ""
        let environment = call.getString("environment") ?? ""
        let logLevel = call.getString("logLevel") ?? ""
        implementation.initAdjust(appToken: appToken, environment: environment, logLevel: logLevel)
        call.resolve()
    }

    @objc func trackEvent(_ call: CAPPluginCall) {
        let eventToken = call.getString("eventToken") ?? ""
        let revenue = call.getDouble("revenue") ?? 0.0
        let currency = call.getString("currency") ?? ""
        let parameters = call.getObject("parameters", [:]) ?? [:]
        //implementation.trackEvent(eventToken: eventToken, revenue: revenue, currency: currency, parameters: parameters)
        call.resolve()
    }

    @objc func getAdid(_ call: CAPPluginCall) {
        call.unimplemented("Not implemented on iOS.")

        // call.resolve(["adid": implementation.getAdid()])
    }
}
