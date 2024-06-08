class Transaction {
  String sender;
  String receiver;
  double amount;
  DateTime date;

  Transaction(this.sender, this.receiver, this.amount, this.date);

  void printTransaction() {
    print('Sender: $sender');
    print('Receiver: $receiver');
    print('Amount: $amount');
    print('Date: $date');
  }
}

void main() {
  var transaction = Transaction('Alice', 'Bob', 100.0, DateTime.now());
  transaction.printTransaction();
}
