import 'package:flutter/material.dart';

class FormLesson extends StatefulWidget {
  const FormLesson({super.key});

  @override
  State<FormLesson> createState() => _FormLessonState();
}

class _FormLessonState extends State<FormLesson> {
  String request = 'Not Sent';
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _update() {
    setState(() {});
  }

  @override
  void initState() {
    _emailController.addListener(_update);
    _passwordController.addListener(_update);
    super.initState();
  }

  @override
  dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 100),

                  /// Email
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }

                      if (!value.endsWith('@gmail.com')) {
                        return 'Please enter a valid email address';
                      }

                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      hintText: 'Email Address',
                      hintStyle: TextStyle(color: Colors.white54),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  /// Password
                  TextFormField(
                    maxLength: 9,
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }

                      if (value.length < 9) {
                        return 'Password must be at least 9 characters';
                      }

                      return null;
                    },
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_open_outlined),
                      suffixIcon: Icon(Icons.remove_red_eye_outlined),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.white54),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  SizedBox(height: 30),

                  /// Login button
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (!_formKey.currentState!.validate()) {
                          request = 'Not Sent';
                          return;
                        } else {
                          request = 'Sent';
                        }
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color:
                            _emailController.text == '' &&
                                _passwordController.text == ''
                            ? Colors.grey
                            : Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 120),

                  /// Simulate Request
                  Text(
                    'Request : $request',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),

                  /// Controllers effect
                  Text(
                    'Email : ${_emailController.text.replaceAll(' ', '')}',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  Text(
                    'Password : ${_passwordController.text}',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
