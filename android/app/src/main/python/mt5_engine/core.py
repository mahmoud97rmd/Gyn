# Path: android/app/src/main/python/mt5_engine/core.py
from mt5_engine.bridge import open_order, close_position, get_positions

class EngineContext:
    def __init__(self, ea_id, config):
        self.ea_id = ea_id
        self.config = config
        self.is_running = False

    def buy(self, lots, sl=None, tp=None):
        open_order(self.config['symbol'], "buy", lots, sl, tp)

    def sell(self, lots, sl=None, tp=None):
        open_order(self.config['symbol'], "sell", lots, sl, tp)

    def get_positions(self):
        return get_positions()

_instances = {}

def load_ea(ea_id, script_class, config):
    context = EngineContext(ea_id, config)
    instance = script_class(context)
    instance.on_init()
    _instances[ea_id] = instance
    return True

def start_ea(ea_id):
    if ea_id in _instances:
        _instances[ea_id].context.is_running = True
        return True
    return False

def stop_ea(ea_id):
    if ea_id in _instances:
        _instances[ea_id].context.is_running = False
        _instances[ea_id].on_deinit()
        return True
    return False

def on_tick(ea_id, bid, ask, timestamp):
    if ea_id in _instances and _instances[ea_id].context.is_running:
        _instances[ea_id].on_tick(bid, ask, timestamp)

def on_candle(ea_id, open_p, high_p, low_p, close_p, volume, timestamp):
    if ea_id in _instances and _instances[ea_id].context.is_running:
        _instances[ea_id].on_candle(open_p, high_p, low_p, close_p, volume, timestamp)
