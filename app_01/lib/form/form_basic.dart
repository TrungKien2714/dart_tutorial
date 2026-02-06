import 'package:flutter/material.dart';

class FormBasic extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FormBasicDemoState();
}

class _FormBasicDemoState extends State<FormBasic> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Basic Demo')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        //Form là widget chứa và quản lý các trường nhập liệu
        //Key được sử dụng để truy cập và quản lý trạng thái của Form
        //phương thức validate() để kiểm tra tính hợp lệ của tất cả các trường nhập liệu bên trong Form
        //phương thức save() để lưu trữ dữ liệu từ các trường nhập liệu
        //phương thức reset() để đặt lại các trường nhập liệu về trạng thái ban đầu
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Họ và tên",
                  hintText: "Nhập họ và tên của bạn",
                  border: OutlineInputBorder(),
                ),
                onSaved: (newValue) => _name = newValue,
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Xin chao $_name")),
                        );
                      }
                    },
                    child: Text("Submit"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _formKey.currentState!.reset();
                      setState(() {
                        _name = null;
                      });
                    },
                    child: Text("Reset"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
