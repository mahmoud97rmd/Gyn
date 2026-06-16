# Path: android/app/src/main/python/mt5_engine/bridge.py
# In a real environment, this would use chaquopy's java package to call Flutter channels.
# We'll mock the interface so core.py can interact with it.

try:
    from java import jclass
    # Try to get the MethodChannel class or the MainActivity instance
    _MainActivity = jclass('com.mt5clone.MainActivity')
except Exception:
    _MainActivity = None

def send_message_to_flutter(method, arguments):
    if _MainActivity:
        # Assuming we implement a static method in MainActivity to route calls back
        pass
    else:
        print(f"Mock send to flutter: {method} - {arguments}")

def open_order(symbol, direction, lots, stop_loss=None, take_profit=None):
    send_message_to_flutter("openOrder", {
        "symbol": symbol,
        "direction": direction,
        "lots": lots,
        "stopLoss": stop_loss,
        "takeProfit": take_profit
    })

def close_position(trade_id):
    send_message_to_flutter("closePosition", {"tradeId": trade_id})

def get_positions():
    # Synchronous fetch would require chaquopy synchronous java call
    return []
