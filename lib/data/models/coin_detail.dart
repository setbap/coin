import 'dart:convert';

const BasePrice = "usd";

class CoinDetail {
  final String id;
  final String symbol;
  final String name;
  final double price;
  final double marketCap;
  final double volume;
  final double change;
  final DateTime updateAt;
  CoinDetail({
    this.id,
    this.symbol,
    this.name,
    this.price,
    this.marketCap,
    this.volume,
    this.change,
    this.updateAt,
  });

  CoinDetail copyWith({
    String id,
    String symbol,
    String name,
    double price,
    double marketCap,
    double volume,
    double change,
    DateTime updateAt,
  }) {
    return CoinDetail(
      id: id ?? this.id,
      symbol: symbol ?? this.symbol,
      name: name ?? this.name,
      price: price ?? this.price,
      marketCap: marketCap ?? this.marketCap,
      volume: volume ?? this.volume,
      change: change ?? this.change,
      updateAt: updateAt ?? this.updateAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'symbol': symbol,
      'name': name,
      'price': price,
      'marketCap': marketCap,
      'volume': volume,
      'change': change,
      'updateAt': updateAt?.millisecondsSinceEpoch,
    };
  }

  factory CoinDetail.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CoinDetail(
      id: map['id'],
      symbol: map['symbol'],
      name: map['name'],
      price: map['$BasePrice'],
      marketCap: map['${BasePrice}_market_cap'],
      volume: map['${BasePrice}_24h_vol'],
      change: map['${BasePrice}_24h_change'],
      // TODO: fix date time
      // DateTime.fromMillisecondsSinceEpoch(map['last_updated_at'])
      updateAt: DateTime.now(),
    );
  }

  String toJson() => json.encode(toMap());

  factory CoinDetail.fromJson(String source) =>
      CoinDetail.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CoinDetail(id: $id, symbol: $symbol, name: $name, price: $price, marketCap: $marketCap, volume: $volume, change: $change, updateAt: $updateAt)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CoinDetail &&
        o.id == id &&
        o.symbol == symbol &&
        o.name == name &&
        o.price == price &&
        o.marketCap == marketCap &&
        o.volume == volume &&
        o.change == change &&
        o.updateAt == updateAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        symbol.hashCode ^
        name.hashCode ^
        price.hashCode ^
        marketCap.hashCode ^
        volume.hashCode ^
        change.hashCode ^
        updateAt.hashCode;
  }
}
