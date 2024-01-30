part of 'card_cubit.dart';

@immutable
sealed class CardState {}

final class CardInitial extends CardState {}

final class CardEmpty extends CardState {}

final class CardLoading extends CardState {}

final class CardLoaded extends CardState {
  final List<CardData> list;

  CardLoaded({required this.list});
}
