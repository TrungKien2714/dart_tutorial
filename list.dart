void main() {
  List<String> list1 = ['A', 'B', 'C'];
  var list2 = [1, 2, 3];
  List<String> list3 = [];
  var list4 = List<int>.filled(3, 0);

  //1. them phan tu
  list1.add('D');
  //xoa phan tu
  list1.remove('A');
  list1.removeWhere((e) => e == 0); //xoa phan tu theo dieu kien
  list1.clear(); //xoa toan bo phan tu
  print(list1);
  //truy cap phan tu
  print(list2[0]);
  print(list2.first);
  print(list2.last);
  print(list2.length);
  //kiem tra
  print(list2.isEmpty);
  print(list3.isNotEmpty);
  print('List 3: ${list3.isNotEmpty ? list3 : 'rong'}');
  print(list4.contains(4));
  print(list4.indexOf(0));
  print(list4.lastIndexOf(0));
  //bien doi
  list2.sort();
  print(list3.reversed);
  var list5 = [3, 4, 2, 1, 6, 8, 5];
  print(list5.reversed);
  list5 = list5.reversed.toList();
  print(list5);
  //cat va noi
  var subList = list5.sublist(1, 3);
  print(subList);
  var str_joined = list5.join('-');
  print(str_joined);
  //duyet phan ben trong list
  list5.forEach((element) {
    print(element);
  });
}
