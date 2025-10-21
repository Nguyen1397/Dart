class Rectangle {
  double _length;
  double _width;

  Rectangle(this._length, this._width) {
    if (_length <= 0 || _width <= 0) throw Exception('Kích thước không hợp lệ');
  }

  Rectangle.square(double size) : _length = size, _width = size {
    if (size <= 0) throw Exception('Kích thước không hợp lệ');
  }

  double get length => _length;
  double get width => _width;

  set length(double value) {
    if (value <= 0) throw Exception('Kích thước không hợp lệ');
    _length = value;
  }

  set width(double value) {
    if (value <= 0) throw Exception('Kích thước không hợp lệ');
    _width = value;
  }

  double calArea() {
    return _length * _width;
  }

  double calPerimeter() {
    return 2 * (_length + _width);
  }
}

void main() {
  Rectangle r1 = Rectangle(6, 7);
  Rectangle square1 = Rectangle.square(8);

  print('Hình chữ nhật: Chiều dài ${r1.length}, chiều rộng ${r1.width}');
  print('Chu vi: ${r1.calPerimeter()}, Diện tích: ${r1.calArea()}');

  print('Hình vuông: Cạnh ${square1.length}');
  print('Chu vi: ${square1.calPerimeter()}, Diện tích: ${square1.calArea()}');
}
