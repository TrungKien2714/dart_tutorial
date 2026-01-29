import "package:flutter/material.dart";

class MyButton_2 extends StatelessWidget {
  const MyButton_2({super.key});
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
            ElevatedButton(
              onPressed: () {
                print("ElevatedButton");
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
