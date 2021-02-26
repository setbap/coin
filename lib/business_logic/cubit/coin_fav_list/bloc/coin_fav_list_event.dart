part of 'coin_fav_list_bloc.dart';

abstract class CoinFavListEvent extends Equatable {
  const CoinFavListEvent();

  @override
  List<Object> get props => [];
}

class CoinFavListToggleItem extends CoinFavListEvent {
  final CoinListItem coin;

  CoinFavListToggleItem(this.coin);

  @override
  List<Object> get props => [coin];
}

class CoinFavListUpdate extends CoinFavListEvent {}
