import 'dart:async';

Future<String> layten() async {
  return 'Nguyen Trung Kien';
}

//Ham tra ve Future
Future<String> taiDuLieu() {
  return Future.delayed(Duration(seconds: 3), () => 'Du lieu da tai xong');
}

void hamChinh() {
  print('bat dau tai');
  Future<String> f = taiDuLieu();
  f.then((ketqua) {
    print('ket qua: $ketqua');
  });
  print('tiep tuc cong viec khac');
}

void hamChinh1() async {
  print('bat dau tai');
  String ketqua = await taiDuLieu();
  print('ket qua: $ketqua');
  print('tiep tuc cong viec khac');
}

void main() {
  hamChinh1();
}
