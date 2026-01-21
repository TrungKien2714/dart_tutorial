import 'dart:async';

void viDuStreamDemSo() {
  print("vi du stream dem so");
  Stream<int> stream = Stream.periodic(
    Duration(seconds: 2),
    (x) => x + 5,
  ).take(20);
  stream.listen(
    (x) => print('nghe duoc so: $x'),
    onDone: () => print('da nghe xong'),
    onError: (loi) => print('co loi xay ra'),
  );
}

void viDuStream2() {
  StreamController<String> controller = StreamController<String>();
  controller.stream.listen(
    (tinnhan) => print('tin nhan moi: $tinnhan'),
    onDone: () => print('khong con tin nhan moi'),
  );
  print('Gui tin nhan dau tien');
  controller.add('xin chao');
  Future.delayed(Duration(seconds: 2), () {
    print('Dang gui tin nhan thu 2');
    controller.add('how are you?');
  });
  Future.delayed(Duration(seconds: 4), () {
    print('Dang gui tin nhan cuoi');
    controller.add('sayonara');
    controller.close();
  });
}

void main() {
  // viDuStreamDemSo();
  viDuStream2();
}
