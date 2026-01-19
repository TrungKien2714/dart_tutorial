void main() {
  // Map la cau truc du lieu luu tru cap key-value
  //moi key phan tu trong map la duy nhat
  //value co the bi trung lap
  //key-value co the co bat ky kieu du lieu nao
  //cach khai bao
  Map<String, dynamic> user1 = {'name': 'Kien', 'age': 22, 'isStudent': true};
  var user2 = <String, dynamic>{'name': 'Kien', 'age': 22};
  Map<int, String> numbers = {};
  var emptyMap = Map<String, int>();
  user1['email'] = 'kien@example.com';
  user1['age'] = 23;
  user1.putIfAbsent('phone', () => '123-456-7890');
  user1.addAll({'address': '1 MacDonald St', 'city': 'Sydney'});
  //xoa
  user1.remove('age');
  user1.removeWhere((key, value) => value == null);
  user1.clear();
  //truy cap
  print(user1['name']);
  print(user1.length);

  //lay value an toan voi gia tri mac dinh
  String phone = user1['phone'] ?? 'No phone number';
  //kiem tra
  print(user1.isEmpty);
  print(user1.isNotEmpty);
  print(user1.containsKey('name'));
  print(user1.containsValue('Kien'));
  //lay danh sach
  print(user1.keys);
  print(user1.values);
  print(user2.entries);
  //duyet map theo key-value
  user2.forEach((key, value) {
    print('$key:$value');
  });
  //duyet qua entries
  for (var entry in user2.entries) {
    print('${entry.key}:${entry.value}');
  }
  user2.entries.forEach((entry) {
    print('${entry.key}:${entry.value}');
  });
  //bien doi
  var upperMap = user2.map((key, value) => MapEntry(key.toUpperCase(), value));
  //loc map
  var filteredMap = user2.entries
      .where((entry) => entry.value is String)
      .toList();
}
