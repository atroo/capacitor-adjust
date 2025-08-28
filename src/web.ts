import Adjust from '@adjustcom/adjust-web-sdk';
import { WebPlugin } from '@capacitor/core';

import type {AdidResult, AdjustEventOptions, AdjustPlugin, InitConfig} from './definitions';

export class AdjustWeb extends WebPlugin implements AdjustPlugin {
  async initAdjust(options: InitConfig): Promise<void> {
    const { appToken, environment = 'production' } = options;
    let {logLevel: logLevelStr} = options
    let logLevel: Adjust.LogLevel | undefined;
    if (!logLevelStr) {
      logLevelStr = environment === 'production' ? 'error' : 'verbose';
    }
    switch (logLevelStr) {
      case 'verbose':
      case 'info':
      case 'error':
        logLevel = logLevelStr
        break
      case 'warn':
        logLevel = 'warning'
        break
      default:
        logLevel = 'none'
        break;
    }
    Adjust.initSdk({
      appToken,
      environment,
      logLevel
    });
  }

  async trackEvent(options: AdjustEventOptions): Promise<void> {
    const { eventToken, revenue, currency, parameters } = options;
    await Adjust.trackEvent({
      eventToken,
      revenue,
      currency,
      callbackParams: Object.entries(parameters).map(([key, value]) => ({ key, value }))
    });
  }

  async getAdid(): Promise<AdidResult> {
    const adid = await Adjust.waitForWebUUID();
    return {
      adid
    }
  }
}
