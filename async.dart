Future<void> getUserInfo() async {
  try {
    print("Dang ket noi....");
    await Future.delayed(const Duration(seconds: 2));
    throw Exception("Loi ket noi");
  } catch (e) {
    print("Co loi xay ra");
  } finally {
    print("Ket thuc ket noi");
  }
}

void main() {
  getUserInfo();
}
