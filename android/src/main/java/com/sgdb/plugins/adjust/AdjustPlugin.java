package com.sgdb.plugins.adjust;

import android.content.Context;

import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;
import com.adjust.sdk.Adjust;
import com.adjust.sdk.AdjustConfig;
import com.adjust.sdk.AdjustEvent;
import com.adjust.sdk.LogLevel;

import java.util.Iterator;

@CapacitorPlugin(name = "Adjust")
public class AdjustPlugin extends Plugin {

    @PluginMethod
    public void init(PluginCall call) {
        String appToken = call.getString("appToken");
        String environment = call.getString("environment");
        String logLevelStr= call.getString("logLevel");
        Context context = getContext();

        if (environment == null) {
            environment = "production";
        }

        if (logLevelStr == null) {
            logLevelStr = "production".equals(environment) ? "error" : "verbose";
        }

        LogLevel logLevel = LogLevel.VERBOSE;

        switch (logLevelStr) {
            case "verbose":
                logLevel = LogLevel.VERBOSE;
                break;
            case "info":
                logLevel = LogLevel.INFO;
                break;
            case "debug":
                logLevel = LogLevel.DEBUG;
                break;
            case "warn":
                logLevel = LogLevel.WARN;
                break;
            case "error":
                logLevel = LogLevel.ERROR;
                break;
            case "assert":
                logLevel = LogLevel.ASSERT;
                break;
        }

        AdjustConfig config = new AdjustConfig(context,appToken, environment);
        config.setLogLevel(logLevel);
        Adjust.initSdk(config);

        call.resolve();
    }

    @PluginMethod
    public void trackEvent(PluginCall call) {
        String eventToken = call.getString("eventToken");
        JSObject parameters = call.getObject("parameters", new JSObject());
        Double revenue = call.getDouble("revenue");
        String currency = call.getString("currency");

        if (eventToken != null) {
            AdjustEvent event = new AdjustEvent(eventToken);
            if (revenue != null && currency != null) {
                event.setRevenue(revenue, currency);
            }
            // 自定义参数（如金额、币种等）
            assert parameters != null;
            for (Iterator<String> it = parameters.keys(); it.hasNext(); ) {
                String key = it.next();
                event.addCallbackParameter(key, parameters.getString(key));
            }
            Adjust.trackEvent(event);
        }
        call.resolve();
    }

    @Override
    protected void handleOnResume() {
        super.handleOnResume();
        Adjust.onResume();
    }

    @Override
    protected void handleOnPause() {
        super.handleOnPause();
        Adjust.onPause();
    }
}
