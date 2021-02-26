part of 'coin_fav_list_bloc.dart';

class CoinFavListState extends Equatable {
  final bool isLoading;
  final String errorMessage;
  final List<CoinDetail> dataList;
  final DateTime lastUpdate;

  const CoinFavListState({
    this.isLoading,
    this.errorMessage,
    this.dataList,
    this.lastUpdate,
  });

  @override
  List<Object> get props =>
      [isLoading, errorMessage, dataList.length, lastUpdate];

  CoinFavListState copyWith({
    bool isLoading,
    String errorMessage,
    List<CoinDetail> dataList,
    DateTime lastUpdate,
  }) {
    return CoinFavListState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      dataList: dataList ?? this.dataList,
      lastUpdate: lastUpdate ?? this.lastUpdate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isLoading': isLoading,
      'errorMessage': errorMessage,
      'dataList': dataList?.map((x) => x?.toMap())?.toList() ?? [],
      'lastUpdate': lastUpdate?.millisecondsSinceEpoch,
    };
  }

  factory CoinFavListState.fromMap(Map<String, dynamic> map) {
    if (map == null)
      return CoinFavListState(
        isLoading: false,
        errorMessage: "",
        dataList: [],
      );

    return CoinFavListState(
      isLoading: map['isLoading'],
      errorMessage: map['errorMessage'],
      dataList: List<CoinDetail>.from(
          map['dataList']?.map((x) => CoinDetail.fromMap(x))),
      lastUpdate: DateTime.fromMillisecondsSinceEpoch(map['lastUpdate']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CoinFavListState.fromJson(String source) =>
      CoinFavListState.fromMap(json.decode(source));

  @override
  bool get stringify => true;
}
