//records la mot kieu du lieu tong hop duoc gioi thieu trong Dart 3
//Nó cho phep ta gom nhom cac gia tri lien quan lai voi nhau thanh mot don vi duy nhat
void main() {
  var r = ('first', 'x', 5, 10.5, true, a: 2); //khai bao mot record
  var point = (123, 456);
  var person = (name: 'Alice', age: 30, 5);
  //truy cap cac gia tri trong record
  //dung chi so
  print(point.$1);
  print(person.$1);
  //dung ten
  print(person.name);
}
