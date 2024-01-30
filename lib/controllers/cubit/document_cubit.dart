import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wallet/controllers/wallet_bd.dart';

part 'document_state.dart';

class DocumentCubit extends Cubit<DocumentState> {
  DocumentCubit() : super(DocumentInitial());

  Future<void> addDocument(PersonData personData) async {
    final walletDatabase = WalletDatabase();
    await walletDatabase.insertPerson(personData);
    await selectDocument();
  }

  Future<void> selectDocument() async {
    emit(DocumentLoading());
    final walletDatabase = WalletDatabase();
    final allPersons = await walletDatabase.getPersons();
    emit(DocumentLoaded(list: allPersons));
  }
}
