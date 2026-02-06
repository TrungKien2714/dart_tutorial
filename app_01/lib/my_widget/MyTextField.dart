import "package:flutter/material.dart";

class MyTextField extends StatelessWidget {
  const MyTextField({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App 01"),
        backgroundColor: Colors.blue,
        //do bong cua appbar
        elevation: 4,
        actions: [
          IconButton(
            onPressed: () {
              print("b1");
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              print("b2");
            },
            icon: Icon(Icons.abc),
          ),
          IconButton(
            onPressed: () {
              print("b3");
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              //TextField là một widget cho phép người dùng nhập văn bản
              //thông qua bàn phím
              //đây là thành phần thiết yếu trong các biểu mẫu và giao diện người dùng tương tác
              TextField(
                decoration: InputDecoration(
                  labelText: "Họ và tên",
                  hintText: "Nhập họ và tên của bạn",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 50),
              TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Ex: example@gmail.com",
                  helperText: "Vui lòng nhập email cá nhân",
                  prefixIcon: Icon(Icons.email),
                  suffixIcon: Icon(Icons.clear),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: Colors.green,
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 50),
              TextField(
                decoration: InputDecoration(
                  labelText: "Số điện thoại",
                  hintText: "Ex: 0123456789",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 50),
              TextField(
                onChanged: (value) {
                  print("Dang nhap:$value");
                },
                onSubmitted: (value) {
                  print("Da nhap xong:$value");
                },
                decoration: InputDecoration(
                  labelText: "Mật khẩu",
                  hintText: "Nhập mật khẩu của bạn",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                obscureText: true,
                obscuringCharacter: '*',
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("pressed");
        },
        child: const Icon(Icons.add_a_photo),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
