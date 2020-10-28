import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quotz/models/quote_model.dart';
import 'package:quotz/repository/quote_repository.dart';

class QuoteViewModel extends ChangeNotifier {
  QuoteViewModel() {
    getQuotes();
  }
  QuoteRepository quoteRepository = new QuoteRepository();
  bool loading = false;
  bool error = false;
  bool success = false;

  QuoteModel quote;

  Future<void> getQuotes() async {
    loading = true;
    notifyListeners();
    try {
      final res = await quoteRepository.getQuote();
      print(res);
      quote = res[0];
      loading = false;
      notifyListeners();
    } catch (e) {
      print(e.toString());
      error = true;
      loading = false;
      notifyListeners();
    }
  }
}

final quoteProvider = ChangeNotifierProvider<QuoteViewModel>((ref) {
  return QuoteViewModel();
});
