import 'dart:io';

class Book {
  String _title;
  String _author;
  double _price;
  String _category;

  Book(this._title, this._author, this._price, this._category) {
    if (_price <= 0) throw Exception('Giá không hợp lệ');
    if (!['Văn học', 'Khoa học', 'Kỹ thuật'].contains(_category)) {
      throw Exception('Thể loại không hợp lệ');
    }
  }

  String get title => _title;
  double get price => _price;
  String get category => _category;

  set price(double value) {
    if (value <= 0) throw Exception('Giá không hợp lệ');
    _price = value;
  }

  String getDetails() => '[$_title]: $_author, $_category, Giá: $_price';
}

class Library {
  List<Book> _books = [];

  void addBook(Book book) {
    _books.add(book);
  }

  void removeBook(String title) {
    _books.removeWhere((book) => book.title == title);
  }

  List<Book> findBooksByCategory(String category) {
    return _books.where((book) => book.category == category).toList();
  }

  double calculateTotalValue() {
    return _books.fold(0, (sum, book) => sum + book.price);
  }

  List<Book> get books => _books;
}

void main() {
  var library = Library();

  try {
    // Thêm sách
    library.addBook(Book('Sách Văn học', 'Nguyễn Du', 25.0, 'Văn học'));
    library.addBook(Book('Sách Khoa học', 'Einstein', 50.0, 'Khoa học'));
    library.addBook(Book('Sách Kỹ thuật', 'Tesla', 75.0, 'Kỹ thuật'));
    library.addBook(Book('Sách Toán', 'Gauss', 40.0, 'Khoa học'));
    library.addBook(Book('Sách Văn', 'Tố Hữu', 30.0, 'Văn học'));

    // Xóa sách
    library.removeBook('Sách Văn');

    // Tìm sách theo thể loại
    var scienceBooks = library.findBooksByCategory('Khoa học');

    // In kết quả
    print('Danh sách sách:');
    for (var book in library.books) {
      print(book.getDetails());
    }
    print('Tổng giá trị: ${library.calculateTotalValue().toStringAsFixed(2)}');
    print('Sách theo thể loại Khoa học:');

    for (var book in scienceBooks) {
      print(
        '${book.title}: ${book.getDetails().split(', ')[1]}, Giá: ${book.price}',
      );
    }
  } catch (e) {
    print('Lỗi: $e');
  }
}
