import 'package:flutter/material.dart';

class Mytextfield2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<Mytextfield2> {
  final _textController = TextEditingController();
  String _inputText = "";
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              TextField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: "Enter Text",
                  hintText: "Type something here",
                  border: OutlineInputBorder(),
                  prefix: Icon(Icons.person),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _textController.clear();
                    },
                    icon: Icon(Icons.clear),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _inputText = value;
                  });
                },
              ),
              SizedBox(height: 20),
              Text("You typed: $_inputText"),
            ],
          ),
        ),
      ),
    );
  }
}
