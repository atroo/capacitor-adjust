
/**
 * adjust init config
 */
export interface InitConfig {
  appToken: string;
  environment?: 'sandbox' | 'production';
  logLevel?: 'verbose' | 'debug' | 'info' | 'warn' | 'error' | 'assert';
}

/**
 * adjust custom event options
 */
export interface AdjustEventOptions {
  eventToken: string;
  revenue?: number;
  currency?: string;
  parameters: Record<string, string>;
}

export interface AdidResult {
  adid: string;
}

export interface AdjustPlugin {
  /**
   * adjust init
   */
  init(options: InitConfig): Promise<void>;
  /**
   * track custom event
   */
  trackEvent(options: AdjustEventOptions): Promise<void>

  getAdid(): Promise<AdidResult>
}