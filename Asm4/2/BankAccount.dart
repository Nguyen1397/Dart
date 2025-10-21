class BankAccount {
  String _accountNumber;
  double _balance;

  BankAccount(this._accountNumber, this._balance) {
    if (_balance < 0) throw Exception('Số dư ban đầu không hợp lệ');
  }

  String get accountNumber => _accountNumber;
  double get balance => _balance;

  void deposit(double amount) {
    if (amount <= 0) throw Exception('Số tiền nạp vào không hợp lệ');
    _balance += amount;
  }

  void withdraw(double amount) {
    if (amount <= 0) throw Exception('Số tiền rút không hợp lệ');
    if (amount > _balance) throw Exception('Số dư không đủ');
    _balance -= amount;
  }
}

void main() {
  BankAccount account = BankAccount('123456789', 4000);
  account.deposit(2000);
  account.withdraw(4000);

  print('Tài khoản: ${account.accountNumber}');
  print('Số dư: ${account.balance}');
}
