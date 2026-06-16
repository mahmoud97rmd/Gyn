# MT5 Clone - Professional Trading Platform

A production-grade, highly performant Android trading platform built with Flutter. It aims to replicate and extend the core functionalities of MetaTrader 5, bringing a modern interface, real-time data streaming, and an embedded Python-based Expert Advisor (EA) engine.

## Features

- **Strict Clean Architecture:** Domain-Driven Design separating concerns via `core`, `features`, and `domain` layers.
- **Riverpod v2:** Scalable, reactive state management powering streaming tick prices, order flow, and UI rendering.
- **Drift (SQLite):** Persistent local database with reactive streams for `EaInstances`, `EaLogs`, `Candles`, and `ClosedTrades`.
- **Custom Charting Engine:** High-performance candlestick rendering built from scratch using Flutter's `CustomPainter`. Supports live tick updates, pan/zoom, and crosshair interaction.
- **Real-Time Trading:** Directly integrated with Oanda REST v20 API for live account operations (Market/Limit/Stop orders, SL/TP modifications).
- **Expert Advisor (EA) Engine:** A revolutionary system allowing you to run automated trading bots locally on your Android device. Upload scripts, view live log streams, and manage instances individually.
- **Oanda API Integrated:** Securely stores API keys and Account IDs in `flutter_secure_storage`.
- **Dynamic Theming:** Seamless Dark and Light modes using modern Material 3 design paradigms.

## Architecture

```
lib/
├── core/
│   ├── database/    # Drift SQLite Tables, DAOs, and Migrations
│   ├── network/     # Dio Client, Interceptors
│   ├── security/    # Encrypted Credential Storage
│   ├── theme/       # Dynamic Dark/Light Theme Providers
│   └── routing/     # GoRouter configurations
├── features/
│   ├── chart/       # Real-time Candlestick Painters & State
│   ├── ea_engine/   # Expert Advisor Upload, Logs, and Lifecycle
│   ├── history/     # Trade Journal, PnL Sync, Win-Rate tracking
│   ├── settings/    # Credentials, Theme Toggle
│   └── trading/     # Order Execution, Symbol Watchlists, Positions
└── main.dart
```

## Setup & Build

1. **Install Dependencies:**
   ```bash
   flutter pub get
   ```

2. **Generate Code (Drift/Freezed):**
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

3. **Format Code:**
   ```bash
   dart format lib/
   ```

4. **Analyze Code:**
   ```bash
   flutter analyze
   ```

5. **Build APK:**
   ```bash
   flutter build apk --release
   ```

## Configuring Your Account

1. Launch the app and navigate to the **Settings** tab.
2. Tap on **Oanda Credentials**.
3. Enter your active Oanda v20 API Key and Account ID.
4. The system will automatically authenticate and begin streaming live market data for your Watchlist.

## Using the EA Engine

Navigate to the **EAs** tab on the bottom navigation bar. From here you can:
- **Import** Python/Dart bot scripts (simulated locally via standard I/O bridging).
- **Start/Stop** algorithms independently across multiple symbols.
- Tap any running bot to view a live streaming **Journal Log** containing real-time debug outputs and executed trade events.

## Technologies Used

- [Flutter](https://flutter.dev) (v3.22+)
- [Riverpod](https://riverpod.dev)
- [Drift (SQLite)](https://drift.simonbinder.eu)
- [Dio](https://github.com/cfug/dio)
- [GoRouter](https://pub.dev/packages/go_router)
- [Flutter Secure Storage](https://pub.dev/packages/flutter_secure_storage)
