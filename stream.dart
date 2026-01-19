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

void main() {
  viDuStreamDemSo();
}
