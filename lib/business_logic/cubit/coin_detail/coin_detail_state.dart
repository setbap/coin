part of 'coin_detail_cubit.dart';

abstract class CoinDetailState extends Equatable {
  const CoinDetailState();

  @override
  List<Object> get props => [];
}

class CoinDetailLoading extends CoinDetailState {}

class CoinDetailError extends CoinDetailState {
  final String errorMessage;

  const CoinDetailError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class CoinDetailData extends CoinDetailState {
  final CoinDetail coinDetail;

  const CoinDetailData({this.coinDetail});

  @override
  List<Object> get props => [coinDetail];
}
