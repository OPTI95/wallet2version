import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wallet/controllers/wallet_bd.dart';

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(ContactInitial());
  Future<void> addContact(ContactData contactData) async {
    final walletDatabase = WalletDatabase();
    await walletDatabase.insertContact(contactData);
    await selectContact();
  }

  Future<void> selectContact() async {
    emit(ContactLoading());
    final walletDatabase = WalletDatabase();
    await walletDatabase.createContactsTable();
    final allContacts = await walletDatabase.getAllContacts();
    if (allContacts.isEmpty) {
      emit(ContacEmpty());
    } else {
      emit(ContactLoaded(list: allContacts));
    }
  }
}
