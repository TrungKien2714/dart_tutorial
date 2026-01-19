import 'dart:math';
import 'dart:io';
// ax^2+bx+c=0

void main() {
  double a = 0, b = 0, c = 0;
  do {
    stdout.write('Nhap a:');
    String? inputA = stdin.readLineSync();
    if (inputA != null) {
      a = double.tryParse(inputA) ?? 0;
    }
  } while (a == 0);

  stdout.write('Nhap b:');
  String? inputB = stdin.readLineSync();
  if (inputB != null) {
    b = double.tryParse(inputB) ?? 0;
  }
  stdout.write('Nhap c:');
  String? inputC = stdin.readLineSync();
  if (inputC != null) {
    c = double.tryParse(inputC) ?? 0;
  }
  //hien thi phuong trinh
  print('phuong trinh: ${a}x^2 + ${b}x + ${c} = 0');
  //tinh delta
  double delta = b * b - a * 4 * c;
  //giai phuong trinh
  if (delta < 0) {
    print('phuong trinh vo nghiem');
  } else if (delta == 0) {
    double x = -b / (2 * a);
    print('phuong trinh co nghiem kep x1=x2=${x.toStringAsFixed(2)}');
  } else {
    double x1 = (-b + sqrt(delta)) / (2 * a);
    double x2 = (-b - sqrt(delta)) / (2 * a);
    print(
      'phuong trinh co 2 nghiem phan biet: x1=${x1.toStringAsFixed(2)}, x2=${x2.toStringAsFixed(2)}',
    );
  }
}
