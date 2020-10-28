import 'package:quotz/models/quote_model.dart';
import 'package:quotz/services/quote_apiservice.dart';

class QuoteRepository {
  QuoteService quoteService = QuoteService();

  Future<List<QuoteModel>> getQuote() async {
    final quotes = await quoteService.getQuotes();
    return quotes;
  }
}
