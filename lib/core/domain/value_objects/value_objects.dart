// Path: lib/core/domain/value_objects/value_objects.dart
import 'package:equatable/equatable.dart';

class Price extends Equatable {
  final double value;
  final int precision;

  const Price(this.value, this.precision) : assert(value >= 0);

  String format() => value.toStringAsFixed(precision);

  @override
  List<Object> get props => [value, precision];
}

class Lots extends Equatable {
  final double value;

  const Lots(this.value) : assert(value >= 0.01 && value <= 1000);

  double toUnits(int contractSize) => value * contractSize;

  @override
  List<Object> get props => [value];
}

class Pips extends Equatable {
  final double value;

  const Pips(this.value);

  factory Pips.fromPriceDelta(double delta, double pipSize) {
    return Pips(delta / pipSize);
  }

  double toPrice(double pipSize) => value * pipSize;

  @override
  List<Object> get props => [value];
}

class Money extends Equatable {
  final double value;
  final String currency;

  const Money(this.value, {this.currency = 'USD'});

  Money operator +(Money other) {
    assert(currency == other.currency);
    return Money(value + other.value, currency: currency);
  }

  Money operator -(Money other) {
    assert(currency == other.currency);
    return Money(value - other.value, currency: currency);
  }

  String display() =>
      '\$${value.toStringAsFixed(2)}'; // Simplified to USD for now

  @override
  List<Object> get props => [value, currency];
}

class Spread extends Equatable {
  final double pips;

  const Spread(this.pips);

  factory Spread.fromBidAsk(double bid, double ask, double pipSize) {
    return Spread((ask - bid) / pipSize);
  }

  String display() => pips.toStringAsFixed(1);

  @override
  List<Object> get props => [pips];
}
