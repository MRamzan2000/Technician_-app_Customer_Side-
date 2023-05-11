class TransactionsList {
  List<Transaction> transactions;

  TransactionsList({required this.transactions});

  factory TransactionsList.fromJson(List<dynamic> json) {
    List<Transaction> transactions = [];
    transactions = json.map((i) => Transaction.fromJson(i)).toList();
    return TransactionsList(transactions: transactions);
  }
}

class Transaction {
  String date;
  int amount;
  String sellername;

  Transaction({required this.date, required this.amount, required this.sellername});

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      date: json['date'] as String,
      amount: json['amount'] as int,
      sellername: json['sellername'] as String,
    );
  }
}
