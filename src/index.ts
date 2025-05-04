import { registerPlugin } from '@capacitor/core';

import type { AdjustPlugin } from './definitions';

const Adjust = registerPlugin<AdjustPlugin>('Adjust', {
  web: () => import('./web').then((m) => new m.AdjustWeb()),
});

export * from './definitions';
export { Adjust };
