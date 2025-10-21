class Student {
  String name;
  int age;
  double grade;

  Student(this.name, this.age, this.grade);

  String getGrade() {
    if (grade >= 8.5) return 'Giỏi';
    if (grade >= 7.5) return 'Khá';
    if (grade >= 5.5) return 'Trung bình';
    return 'Yếu';
  }
}

void main() {
  List<Student> students = [
    Student('An', 20, 8.7),
    Student('Bình', 21, 7.2),
    Student('Cường', 19, 4.5),
  ];

  for (var student in students) {
    print(
      'Sinh viên: ${student.name}, Tuổi: ${student.age}, Điểm: ${student.grade}',
    );
    print('Xếp loại: ${student.getGrade()}');
  }
}
