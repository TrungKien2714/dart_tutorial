void main() {
  Set<String> set1 = {'A', 'B', 'C'};
  var set2 = <int>{1, 2, 3};
  Set<String> set3 = Set();
  var set4 = Set<int>.from([1, 2, 2, 3]);
  //them phan tu
  set1.add('D');
  set1.addAll(['E', 'F']);
  //xoa phan tu
  set1.remove('A');
  set1.removeAll(['B', 'C']);
  set1.clear(); //xoa toan bo phan tu
  //truy cap va kiem tra
  print(set1.length);
  print(set1.isEmpty);
  print(set1.contains('A'));

  //cac phep toan tap hop
  var set5 = {1, 2, 3};
  var set6 = {3, 4, 5};
  var union = set5.union(set6); //hop
  var intersection = set5.intersection(set6); //giao
  var difference = set5.difference(set6); //hieu
  //bien doi
  var list = set1.toList();
  var newSet = Set.from(set1);
  //loc va anh xa
  var filtered = set1.where((e) => e.startsWith('A'));
  var mapped = set1.map((e) => e.toLowerCase());
  //xy ly tung phan tu
  set1.forEach((element) {
    print(element);
  });
}
