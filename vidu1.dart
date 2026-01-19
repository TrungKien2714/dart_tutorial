import 'dart:io';

void main() {
  String name = "Kien";
  int age = 22;
  if (age >= 18) {
    print("Hello $name");
  }
  Object obj = "Hi";
  if (obj is String) {
    print("obj la string");
  }
  //Ep kieu
  String str = obj as String;
  print(str.toUpperCase());
  //?? : se gan gia tri neu bien do la null
  int? b;
  b ??= 10;
  print("b= $b");
  var kiemtra = (100 % 2 == 0) ? "100 la so chan" : "100 la so le";
  print(kiemtra);

  //nhap ten nguoi dung
  stdout.write('Nhap ten cua ban: ');
  String ten = stdin.readLineSync()!;
  //nhap tuoi nguoi dung
  stdout.write('Nhap tuoi cua ban: ');
  int tuoi = int.parse(stdin.readLineSync()!);
  print("xin chao $ten: $tuoi");

  Dog d = Dog(name: "Thang");
  d.run();
  d.barking();
  print('3'.getInt());
  final current_type = type.audio;
  print(current_type);
  if (chooseEnum.myself.canChooseOther) {
    print("i can choose");
  } else {
    print("ur turn");
  }
  //so thuc -> String
  String piAsString = 3.14159.toStringAsFixed(2);
  print(piAsString);
  //tao chuoi o nhieu dong
  var s4 = '''
  line 1
  line 2
  ''';
  print(s4);
  var s5 = 'Day la mot doan \n van ban';
  print(s5);
  var s6 = r'Day la mot doan \n van ban'; //raw
  print(s6);
}

mixin Runner {
  void run() => print("running");
}
mixin bark {
  void barking() => print("gau gau");
}

class Dog with Runner, bark {
  String name;
  Dog({required this.name});
}

extension numberParsing on String {
  int getInt() {
    return int.parse(this);
  }
}

enum type { any, media, audio, video, custom }

enum chooseEnum {
  myself(code: 1, name: "Myself", canChooseOther: false),
  someOneElse(code: 2, name: "Someone Else", canChooseOther: true);

  final int code;
  final String name;
  final bool canChooseOther;
  const chooseEnum({
    required this.code,
    required this.name,
    required this.canChooseOther,
  });
}
