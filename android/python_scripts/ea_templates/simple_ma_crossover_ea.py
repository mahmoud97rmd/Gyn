# Path: android/python_scripts/ea_templates/simple_ma_crossover_ea.py
import mt5_bridge
from mt5_bridge import api

def on_init():
    print("INFO: Simple MA Crossover EA Initialized")

def on_tick(symbol: str, bid: float, ask: float):
    positions = api.get_positions(symbol)
    
    if len(positions) == 0:
        print(f"DEBUG: Analyzing tick for {symbol} - Bid: {bid}, Ask: {ask}")
        # api.buy(symbol, 0.1, sl=bid-0.0050, tp=bid+0.0100, comment="MA Cross", magic=12345)

def on_deinit():
    print("INFO: Simple MA Crossover EA De-initialized")
