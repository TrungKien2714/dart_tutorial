import "package:flutter/material.dart";

class MyButton extends StatelessWidget {
  const MyButton({super.key});
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
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            //Elevated Button là một button có đổ bóng,
            //thường dùng cho các hành động chính trong ứng dụng
            ElevatedButton(
              onPressed: () {
                print("Elevated Button pressed");
              },
              child: Text("Elevated Button", style: TextStyle(fontSize: 24)),
            ),
            SizedBox(height: 20),

            //Text button là một button phẳng,
            //không đổ bóng
            //thường dùng cho các hành động phụ hoặc trong các thành phần như dialog , card
            TextButton(
              onPressed: () {
                print("Text Button pressed");
              },
              child: Text("Text Button", style: TextStyle(fontSize: 24)),
            ),

            SizedBox(height: 20),
            //Outlined Button là một button có viền,
            //không có màu nền,
            //phù hợp cho các thay thế
            OutlinedButton(
              onPressed: () {
                print("Outlined Button pressed");
              },
              child: Text("Outlined Button", style: TextStyle(fontSize: 24)),
            ),

            SizedBox(height: 20),
            //Icon Button là một button chỉ chứa biểu tượng,
            //thường dùng cho AppBar , Toolbar hoặc các thành phần nhỏ gọn khác
            IconButton(
              onPressed: () {
                print("Icon Button pressed");
              },
              icon: Icon(Icons.favorite),
            ),

            SizedBox(height: 20),
            //Floating Action Button là một button tròn nổi lên trên giao diện,
            //thường dùng để biểu thị hành động chính trong ứng dụng
            FloatingActionButton(
              onPressed: () {
                print("Floating Action Button pressed");
              },
              child: Icon(Icons.add),
            ),
          ],
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
