import 'package:flutter/material.dart';

class Dropdownlist extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DropdownlistState();
}

class _DropdownlistState extends State<Dropdownlist> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  final _fullnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isObscure = true;
  final List<String> _cities = ['Hà Nội', 'Hồ Chí Minh', 'Đà Nẵng', 'Cần Thơ'];
  String? _selectedCity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Basic Demo')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              //TextFormField  là phiên bản mở rộng của TextField
              //Validator: kiểm tra tính hợp lệ của dữ liệu nhập vào
              //Controller cho phép truy cập và điều khiển dữ liệu nhập vào
              //obscureText: ẩn văn bản nhập vào (thường dùng cho mật khẩu)
              //AutoValidateMode: điều khiển thời điểm validation được kích hoạt
              TextFormField(
                controller: _fullnameController,
                decoration: InputDecoration(
                  labelText: "Họ và tên",
                  hintText: "Nhập họ và tên của bạn",
                  border: OutlineInputBorder(),
                ),
                onSaved: (newValue) => _name = newValue,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Vui lòng nhập họ và tên";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "example@gmail.com",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Vui lòng nhập email";
                  }
                  if (!RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  ).hasMatch(value)) {
                    return "Vui lòng nhập email hợp lệ";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: "Mật khẩu",
                  hintText: "Nhập mật khẩu của bạn",
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                ),
                obscureText: _isObscure,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Vui lòng nhập mật khẩu";
                  }
                  if (value.length < 6) {
                    return "Mật khẩu phải có ít nhất 6 ký tự";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: "Thành phố",
                  border: OutlineInputBorder(),
                ),
                items: _cities.map((city) {
                  return DropdownMenuItem(child: Text(city), value: city);
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCity = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return "Vui lòng chọn thành phố";
                  }
                  return null;
                },
              ),
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
