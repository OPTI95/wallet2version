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

  Future<void> editDocument(PersonData personData) async {
    final walletDatabase = WalletDatabase();
    await walletDatabase.updatePerson(personData);
    await selectDocument();
  }

  Future<void> selectDocument() async {
    emit(DocumentLoading());
    final walletDatabase = WalletDatabase();
    final allPersons = await walletDatabase.getPersons();
    if (allPersons.isEmpty) {
      emit(DocumentEmpty());
    } else {
      emit(DocumentLoaded(list: allPersons));
    }
  }
}
