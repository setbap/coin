import 'dart:convert';

class CoinListItem {
  final String id;
  final String symbol;
  final String name;

  const CoinListItem(
    this.id,
    this.symbol,
    this.name,
  );

  CoinListItem copyWith({
    String id,
    String symbol,
    String name,
  }) {
    return CoinListItem(
      id ?? this.id,
      symbol ?? this.symbol,
      name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'symbol': symbol,
      'name': name,
    };
  }

  factory CoinListItem.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CoinListItem(
      map['id'],
      map['symbol'],
      map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CoinListItem.fromJson(String source) =>
      CoinListItem.fromMap(json.decode(source));

  @override
  String toString() => 'CoinListItem(id: $id, symbol: $symbol, name: $name)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CoinListItem &&
        o.id == id &&
        o.symbol == symbol &&
        o.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ symbol.hashCode ^ name.hashCode;
}
