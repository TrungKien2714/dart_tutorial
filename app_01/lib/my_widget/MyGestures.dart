import "package:flutter/material.dart";

class MyGestures extends StatelessWidget {
  const MyGestures({super.key});
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
            SizedBox(height: 20),
            //GestureDetector - bắt được các sự kiện
            GestureDetector(
              onTap: () => print("Container được nhấn"),
              onDoubleTap: () => print("Container được nhấn đúp"),
              onPanUpdate: (details) => print(
                "Container được kéo, vị trí hiện tại: ${details.delta}",
              ),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: Center(child: Text("Tap me!")),
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
