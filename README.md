# capacitor-adjust

Adjust Plugins for Capacitor

## Install

```bash
npm install @atroo/capacitor-adjust
npx cap sync
```

## API

<docgen-index>

* [`initAdjust(...)`](#initadjust)
* [`trackEvent(...)`](#trackevent)
* [`getAdid()`](#getadid)
* [Interfaces](#interfaces)
* [Type Aliases](#type-aliases)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### initAdjust(...)

```typescript
initAdjust(options: InitConfig) => Promise<void>
```

adjust init

| Param         | Type                                              |
| ------------- | ------------------------------------------------- |
| **`options`** | <code><a href="#initconfig">InitConfig</a></code> |

--------------------


### trackEvent(...)

```typescript
trackEvent(options: AdjustEventOptions) => Promise<void>
```

track custom event

| Param         | Type                                                              |
| ------------- | ----------------------------------------------------------------- |
| **`options`** | <code><a href="#adjusteventoptions">AdjustEventOptions</a></code> |

--------------------


### getAdid()

```typescript
getAdid() => Promise<AdidResult>
```

**Returns:** <code>Promise&lt;<a href="#adidresult">AdidResult</a>&gt;</code>

--------------------


### Interfaces


#### InitConfig

adjust init config

| Prop              | Type                                                                         |
| ----------------- | ---------------------------------------------------------------------------- |
| **`appToken`**    | <code>string</code>                                                          |
| **`environment`** | <code>'sandbox' \| 'production'</code>                                       |
| **`logLevel`**    | <code>'error' \| 'warn' \| 'info' \| 'verbose' \| 'debug' \| 'assert'</code> |


#### AdjustEventOptions

adjust custom event options

| Prop             | Type                                                            |
| ---------------- | --------------------------------------------------------------- |
| **`eventToken`** | <code>string</code>                                             |
| **`revenue`**    | <code>number</code>                                             |
| **`currency`**   | <code>string</code>                                             |
| **`parameters`** | <code><a href="#record">Record</a>&lt;string, string&gt;</code> |


#### AdidResult

| Prop       | Type                |
| ---------- | ------------------- |
| **`adid`** | <code>string</code> |


### Type Aliases


#### Record

Construct a type with a set of properties K of type T

<code>{ [P in K]: T; }</code>

</docgen-api>
