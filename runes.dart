void main() {
  //runes la tap hop cac ma unicode cua chuoi
  //dung de xu ly chuoi co ky tu dac biet
  //moi ky tu unicode duoc bieu dien bang mot so nguyen
  String str = 'Hello';
  Runes runes1 = str.runes;
  Runes runes2 = Runes('\u2665');
  print(runes2);
  Runes runes3 = Runes('\u{1F600}');
  print(runes3);
  //chuyen doi
  String heartSymbol = String.fromCharCodes(runes2);
  print(heartSymbol);
  String emoji = String.fromCharCode(0x1F600);
  print(emoji);
  String symbol = String.fromCharCode(0x2665);
  print(symbol);
  //xu ly
  print(runes1.length);
  print(runes1.first);
  print(runes1.last);
  //duyet qua tung diem ma
  runes1.forEach((int rune) {
    print('Unicode: $rune, Ky tu: ${String.fromCharCode(rune)}');
  });
  //kiem tra
  print(runes1.isEmpty);
  print(runes1.isNotEmpty);
}
