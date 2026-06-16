# Path: android/app/src/main/python/mt5_bridge.py
import sys
import traceback
import importlib.util
from typing import Dict, Any, List, Optional
import os

class TradingAPI:
    def __init__(self):
        self.balance = 0.0
        self.equity = 0.0
        self.free_margin = 0.0
        self.positions: List[Dict[str, Any]] = []

    def get_account_balance(self) -> float:
        return self.balance

    def get_account_equity(self) -> float:
        return self.equity

    def get_free_margin(self) -> float:
        return self.free_margin

    def get_positions(self, symbol: Optional[str] = None) -> List[Dict[str, Any]]:
        if symbol:
            return [p for p in self.positions if p.get('symbol') == symbol]
        return self.positions

    def get_position_count(self, symbol: Optional[str] = None) -> int:
        return len(self.get_positions(symbol))

    def buy(self, symbol: str, volume: float, sl: Optional[float] = None, tp: Optional[float] = None, comment: str = "", magic: int = 0) -> int:
        print(f"TRADE: BUY {volume} {symbol} SL={sl} TP={tp} Magic={magic}")
        return -1

    def sell(self, symbol: str, volume: float, sl: Optional[float] = None, tp: Optional[float] = None, comment: str = "", magic: int = 0) -> int:
        print(f"TRADE: SELL {volume} {symbol} SL={sl} TP={tp} Magic={magic}")
        return -1

    def close_position(self, ticket: int, volume: Optional[float] = None) -> bool:
        print(f"TRADE: CLOSE ticket={ticket} volume={volume}")
        return True

    def modify_position(self, ticket: int, sl: Optional[float] = None, tp: Optional[float] = None) -> bool:
        print(f"TRADE: MODIFY ticket={ticket} SL={sl} TP={tp}")
        return True

api = TradingAPI()

class EaScriptLoader:
    def __init__(self):
        self.loaded_module = None

    def load_script(self, script_path: str, module_name: str) -> bool:
        try:
            spec = importlib.util.spec_from_file_location(module_name, script_path)
            if spec and spec.loader:
                module = importlib.util.module_from_spec(spec)
                sys.modules[module_name] = module
                spec.loader.exec_module(module)
                self.loaded_module = module
                if hasattr(self.loaded_module, 'on_init'):
                    self.loaded_module.on_init()
                return True
            return False
        except Exception as e:
            print(f"ERROR: Failed to load EA script: {e}")
            traceback.print_exc()
            return False

    def dispatch_tick(self, symbol: str, bid: float, ask: float):
        if self.loaded_module and hasattr(self.loaded_module, 'on_tick'):
            try:
                self.loaded_module.on_tick(symbol, bid, ask)
            except Exception as e:
                print(f"ERROR: EA on_tick execution failed: {e}")
                traceback.print_exc()

    def unload(self):
        if self.loaded_module and hasattr(self.loaded_module, 'on_deinit'):
            try:
                self.loaded_module.on_deinit()
            except Exception as e:
                print(f"ERROR: EA on_deinit execution failed: {e}")
                traceback.print_exc()
        self.loaded_module = None

loader = EaScriptLoader()

def dispatch_tick(symbol: str, bid: float, ask: float):
    loader.dispatch_tick(symbol, bid, ask)

def load_ea(script_path: str, module_name: str) -> bool:
    return loader.load_script(script_path, module_name)

def unload_ea():
    loader.unload()

def update_account_info(balance: float, equity: float, free_margin: float):
    api.balance = balance
    api.equity = equity
    api.free_margin = free_margin

def update_positions(positions_list: List[Dict[str, Any]]):
    api.positions = positions_list

def get_version() -> str:
    return "1.0.0"
