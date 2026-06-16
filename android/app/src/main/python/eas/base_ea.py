# Path: android/app/src/main/python/eas/base_ea.py
class BaseEA:
    def __init__(self, context):
        self.context = context
        self.config = context.config

    def on_init(self):
        pass

    def on_deinit(self):
        pass

    def on_tick(self, bid, ask, timestamp):
        pass

    def on_candle(self, open_p, high_p, low_p, close_p, volume, timestamp):
        pass

    def buy(self, lots, sl=None, tp=None):
        self.context.buy(lots, sl, tp)

    def sell(self, lots, sl=None, tp=None):
        self.context.sell(lots, sl, tp)
