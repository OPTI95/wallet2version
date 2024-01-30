import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:wallet/controllers/wallet_bd.dart';

part 'card_state.dart';

class CardCubit extends Cubit<CardState> {
  CardCubit() : super(CardInitial());

  Future<void> loadCards() async {
    emit(CardLoading());
    final database = WalletDatabase();
    await database.open();
    List<CardData> loadedCards = await database.getCards();
    if (loadedCards.isEmpty) {
      emit(CardEmpty());
    } else {
      emit(CardLoaded(list: loadedCards));
    }
    await database.close();
  }

  Future<void> addCard(CardData cardData) async {
    final database = WalletDatabase();
    await database.open();
    await database.insertCard(cardData);
    await database.close();
  }

  Future<void> updateCard(CardData cardData) async {
    final database = WalletDatabase();
    await database.open();
    try {
      if ((cardData.cardNumber != "Пусто" || cardData.cvcCode != "Пусто") ||
          (cardData.cardNumber?.isNotEmpty == true ||
              cardData.cvcCode?.isNotEmpty == true)) {
        if (cardData.cardNumber!.length > 3 || cardData.cvcCode?.length == 3) {
          final updatedCard = CardData(
            id: cardData.id,
            name: cardData.name,
            barcode: cardData.barcode,
            cvcCode: cardData.cvcCode,
            cardNumber: cardData.cardNumber,
          );
          await database.updateCard(updatedCard);
        }
      }
    } catch (error) {
      print('Ошибка при обновлении карты: $error');
    } finally {
      await loadCards();
      await database.close();
    }
  }

  Future<void> deleteCard(int id) async {
    final database = WalletDatabase();
    await database.open();
    await database.deleteCard(id);
    await loadCards();
    await database.close();
  }
}
