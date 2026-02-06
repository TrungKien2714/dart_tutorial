import "package:flutter/material.dart";

class MyButton_3 extends StatelessWidget {
  const MyButton_3({super.key});
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
            //khoa nut
            ElevatedButton(
              onPressed: null,
              child: Text("ElevatedButton", style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                elevation: 15,
              ),
            ),

            SizedBox(height: 20),
            //nhan giu nut
            ElevatedButton(
              onPressed: () {
                print("ElevatedButton");
              },
              onLongPress: () {
                print("Long press ElevatedButton");
              },
              child: Text("ElevatedButton", style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                elevation: 15,
              ),
            ),
            //Inkwell không phải là một button
            //nhưng nó cho phép tạo hiệu ứng gợn sóng (ripple effect) khi người dùng chạm vào
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                print("InkWell");
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                ),
                child: Text("Button tuy chinh voi inkwell"),
              ),
            ),
            SizedBox(height: 20),
            //nhan 2 lan
            InkWell(
              onTap: () {
                print("InkWell");
              },
              onDoubleTap: () => print("Double tap InkWell"),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                ),
                child: Text("Button tuy chinh voi inkwell"),
              ),
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
