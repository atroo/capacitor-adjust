export interface AdjustPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
