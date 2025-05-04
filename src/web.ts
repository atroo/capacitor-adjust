import { WebPlugin } from '@capacitor/core';

import type { AdjustPlugin } from './definitions';

export class AdjustWeb extends WebPlugin implements AdjustPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
