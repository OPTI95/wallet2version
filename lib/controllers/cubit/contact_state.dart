part of 'contact_cubit.dart';

@immutable
sealed class ContactState {}

final class ContactInitial extends ContactState {}

final class ContactLoading extends ContactState {}
final class ContacEmpty extends ContactState {}

final class ContactLoaded extends ContactState {
  final List<ContactData> list;

  ContactLoaded({required this.list});
}
