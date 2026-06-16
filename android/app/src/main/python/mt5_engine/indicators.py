# Path: android/app/src/main/python/mt5_engine/indicators.py
import math

class MovingAverage:
    def __init__(self, period):
        self.period = period
        self.prices = []

    def update(self, price):
        self.prices.append(price)
        if len(self.prices) > self.period:
            self.prices.pop(0)

    @property
    def value(self):
        if len(self.prices) < self.period:
            return None
        return sum(self.prices) / self.period

class RSI:
    def __init__(self, period=14):
        self.period = period
        self.prices = []
        self.gains = []
        self.losses = []
        self.avg_gain = 0
        self.avg_loss = 0

    def update(self, price):
        if len(self.prices) > 0:
            change = price - self.prices[-1]
            if change > 0:
                self.gains.append(change)
                self.losses.append(0)
            else:
                self.gains.append(0)
                self.losses.append(abs(change))
                
            if len(self.gains) > self.period:
                self.gains.pop(0)
                self.losses.pop(0)
                
            if len(self.gains) == self.period:
                self.avg_gain = sum(self.gains) / self.period
                self.avg_loss = sum(self.losses) / self.period
        
        self.prices.append(price)
        if len(self.prices) > self.period + 1:
            self.prices.pop(0)

    @property
    def value(self):
        if self.avg_loss == 0:
            return 100 if self.avg_gain > 0 else 50
        rs = self.avg_gain / self.avg_loss
        return 100 - (100 / (1 + rs))
