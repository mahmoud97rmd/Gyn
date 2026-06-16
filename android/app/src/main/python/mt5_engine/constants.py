# Path: android/app/src/main/python/mt5_engine/constants.py
class Timeframe:
    M1 = "m1"
    M5 = "m5"
    M15 = "m15"
    M30 = "m30"
    H1 = "h1"
    H4 = "h4"
    D1 = "d1"
    W1 = "w1"
    MN1 = "mn1"

class OrderType:
    MARKET = "market"
    BUY_LIMIT = "buyLimit"
    SELL_LIMIT = "sellLimit"
    BUY_STOP = "buyStop"
    SELL_STOP = "sellStop"

class TradeDirection:
    BUY = "buy"
    SELL = "sell"
