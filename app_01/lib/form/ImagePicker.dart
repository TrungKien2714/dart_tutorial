import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class Imagepicker extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ImagepickerState();
}

class _ImagepickerState extends State<Imagepicker> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  final _fullnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _dobController = TextEditingController();
  bool _isObscure = true;
  final List<String> _cities = ['Hà Nội', 'Hồ Chí Minh', 'Đà Nẵng', 'Cần Thơ'];
  String? _selectedCity;
  String? _gender;
  bool _isAgreed = false;
  DateTime? dob;
  File? _image;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Basic Demo')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                FormField<File>(
                  validator: (value) {
                    if (value == null) {
                      return 'Vui lòng chọn ảnh đại diện';
                    }
                    return null;
                  },
                  builder: (FormFieldState<File> state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ảnh đại diện',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 8),
                        Center(
                          child: GestureDetector(
                            onTap: () async {
                              final XFile? image = await showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Chọn nguồn'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                        leading: Icon(Icons.photo_library),
                                        title: Text('Thư viện'),
                                        onTap: () async {
                                          Navigator.pop(
                                            context,
                                            await _picker.pickImage(
                                              source: ImageSource.gallery,
                                            ),
                                          );
                                        },
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.camera_alt),
                                        title: Text('Máy ảnh'),
                                        onTap: () async {
                                          Navigator.pop(
                                            context,
                                            await _picker.pickImage(
                                              source: ImageSource.camera,
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );

                              if (image != null) {
                                setState(() {
                                  _image = File(image.path);
                                  state.didChange(_image);
                                });
                              }
                            },
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(60),
                                border: Border.all(
                                  color: state.hasError
                                      ? Colors.red
                                      : Colors.grey.shade300,
                                  width: 2,
                                ),
                              ),
                              child: _image != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(60),
                                      child: Image.file(
                                        _image!,
                                        width: 120,
                                        height: 120,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : Icon(
                                      Icons.add_a_photo,
                                      size: 40,
                                      color: Colors.grey.shade400,
                                    ),
                            ),
                          ),
                        ),
                        if (state.hasError)
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Text(
                                state.errorText!,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
                SizedBox(height: 20),

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
                  controller: _dobController,
                  decoration: InputDecoration(
                    labelText: 'Ngày sinh',
                    hintText: 'Chọn ngày sinh của bạn',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (pickDate != null) {
                      dob = pickDate;
                      _dobController.text = DateFormat(
                        'dd/MM/yyyy',
                      ).format(pickDate);
                    }
                  },
                ),
                SizedBox(height: 20),
                FormField<String>(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Vui lòng chọn giới tính";
                    }
                    return null;
                  },
                  initialValue: _gender,
                  builder: (FormFieldState<String> state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Giới tính"),
                        Row(
                          children: [
                            Expanded(
                              child: RadioListTile<String>(
                                title: Text("Nam"),
                                value: 'male',
                                groupValue: _gender,
                                onChanged: (value) {
                                  setState(() {
                                    _gender = value;
                                    state.didChange(value);
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: RadioListTile<String>(
                                title: Text("Nữ"),
                                value: 'female',
                                groupValue: _gender,
                                onChanged: (value) {
                                  setState(() {
                                    _gender = value;
                                    state.didChange(value);
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        if (state.hasError)
                          Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: Text(
                              state.errorText!,
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            ),
                          ),
                      ],
                    );
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

                SizedBox(height: 20),
                CheckboxListTile(
                  title: Text('Đồng ý với điều khoản'),
                  value: _isAgreed,
                  onChanged: (value) {
                    setState(() {
                      _isAgreed = value!;
                      print('Đồng ý: $_isAgreed');
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
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
      ),
    );
  }
}
