part of 'document_cubit.dart';

@immutable
sealed class DocumentState {}

final class DocumentInitial extends DocumentState {}
final class DocumentLoading extends DocumentState {}
final class DocumentEmpty extends DocumentState {}
final class DocumentLoaded extends DocumentState {
  final List<PersonData> list;

  DocumentLoaded({required this.list});
}


