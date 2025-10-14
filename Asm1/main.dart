import 'dart:io';
import 'dart:math';

// 1
void hoSoCaNhan() {
  String name = 'Nguyễn Khôi Nguyên';
  int age = 23;
  String school = 'Đại học Công nghệ';
  String hobbies = 'Đọc sách, Chơi bóng, Nghe nhạc';
  List<String> hobbyList = hobbies.split(', ');

  print('Hồ sơ cá nhân');
  print('-------------');
  print('Tên: $name');
  print('Tuổi: $age');
  print('Trường: $school');
  print('Sở thích: ${hobbyList.join(', ')}');
}

// 2
void bmi() {
  double weight = 70.5;
  double height = 1.75;
  double bmi = weight / (height * height);
  String status;

  if (bmi < 18.5) {
    status = 'Gầy';
  } else if (bmi < 25) {
    status = 'Bình thường';
  } else if (bmi < 30) {
    status = 'Thừa cân';
  } else {
    status = 'Béo phì';
  }

  print('Chỉ số BMI: ${bmi.toStringAsFixed(2)}');
  print('Tình trạng: $status');
}

void soHoanHao() {
  int number = 28;
  int sum = 0;
  for (int i = 1; i < number; i++) {
    if (number % i == 0) {
      sum += i;
    }
  }
  if (sum == number) {
    print('Số $number là số hoàn hảo');
  } else {
    print('Số $number không phải số hoàn hảo');
  }
}

// 3
void phanLoaiHS() {
  print('Nhập điểm Toán: ');
  double math = double.parse(stdin.readLineSync()!);
  print('Nhập điểm Lý: ');
  double physics = double.parse(stdin.readLineSync()!);
  print('Nhập điểm Hóa: ');
  double chemistry = double.parse(stdin.readLineSync()!);

  if (math < 0 ||
      math > 10 ||
      physics < 0 ||
      physics > 10 ||
      chemistry < 0 ||
      chemistry > 10) {
    print('Điểm không hợp lệ');
    return;
  }
  double avg = (math + physics + chemistry) / 3;
  String grade;
  if (avg >= 9.0) {
    grade = 'Xuất sắc';
  } else if (avg >= 8.0) {
    grade = 'Giỏi';
  } else if (avg >= 6.5) {
    grade = 'Khá';
  } else if (avg >= 5.0) {
    grade = 'Trung bình';
  } else {
    grade = 'Yếu';
  }

  print('Điểm trung bình: ${avg.toStringAsFixed(2)}');
  print('Xếp loại: $grade');
}

void ptBac2() {
  print('Nhập a: ');
  double a = double.parse(stdin.readLineSync()!);
  print('Nhập b: ');
  double b = double.parse(stdin.readLineSync()!);
  print('Nhập c: ');
  double c = double.parse(stdin.readLineSync()!);

  print('Phương trình: ${a}x² + ${b}x + ${c} = 0');
  if (a == 0) {
    if (b == 0) {
      print('Kết quả: ${c == 0 ? "Vô số nghiệm" : "Vô nghiệm"}');
    } else {
      print('Kết quả: Nghiệm x = ${-c / b}');
    }
    return;
  }

  double delta = b * b - 4 * a * c;
  if (delta > 0) {
    double x1 = (-b + sqrt(delta)) / (2 * a);
    double x2 = (-b - sqrt(delta)) / (2 * a);
    print(
      'Kết quả: Hai nghiệm phân biệt x1 = ${x1.toStringAsFixed(2)}, x2 = ${x2.toStringAsFixed(2)}',
    );
  } else if (delta == 0) {
    double x = -b / (2 * a);
    print('Kết quả: Nghiệm kép x = ${x.toStringAsFixed(2)}');
  } else {
    print('Kết quả: Vô nghiệm');
  }
}

// 4
void quanLyHS() {
  print('Nhập tên học sinh: ');
  String? name = stdin.readLineSync();
  print('Nhập tuổi: ');
  int age = int.parse(stdin.readLineSync()!);
  print('Nhập điểm trung bình: ');
  double score = double.parse(stdin.readLineSync()!);
  print('Nhập số hoạt động ngoại khóa (0-5): ');
  int activities = int.parse(stdin.readLineSync()!);

  if (age < 10 || score < 0 || score > 10 || activities < 0 || activities > 5) {
    print('Dữ liệu không hợp lệ');
    return;
  }

  double bonus = activities * 0.5;
  if (bonus > 2.0) bonus = 2.0;
  double finalScore = score + bonus;
  String grade;
  if (finalScore >= 9.0) {
    grade = 'Xuất sắc';
  } else if (finalScore >= 8.0) {
    grade = 'Giỏi';
  } else if (finalScore >= 6.5) {
    grade = 'Khá';
  } else if (finalScore >= 5.0) {
    grade = 'Trung bình';
  } else {
    grade = 'Yếu';
  }

  print('Hồ sơ học sinh');
  print('-------------');
  print('Tên: $name');
  print('Tuổi: $age');
  print('Điểm trung bình: ${score.toStringAsFixed(2)}');
  print('Số hoạt động ngoại khóa: $activities');
  print('Điểm thưởng: ${bonus.toStringAsFixed(2)}');
  print('Điểm tổng kết: ${finalScore.toStringAsFixed(2)}');
  print('Xếp loại: $grade');
}
