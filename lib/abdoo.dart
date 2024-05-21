import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noets_app/veiws/notes_veiw.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  static const emailRegex = "@gmail.com";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Stack(
        children: [
          // الخلفية
          Positioned.fill(
            child: Image.asset(
              'assets/images/image_processing20200106-10064-rkm2p2.jpg', // تأكد من وضع الصورة في مجلد assets
              fit: BoxFit.cover,
            ),
          ),
          // محتوى الشاشة
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email, color: Colors.white),
                        hintText: 'Email id',
                        hintStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                      validator: (value) {
                        if (RegExp(LoginScreen.emailRegex).hasMatch(value!)) {
                        } else if (value == null || value.isEmpty) {
                          return "@gmail.com";
                        } else {
                          return "@gmail.com";
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock, color: Colors.white),
                        hintText: 'Enter Your Password',
                        hintStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Field cannot be empty";
                        } else if (value.length < 5) {
                          return "Must be at least 6 chars";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 40),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            // قم بإضافة وظيفة نسيت كلمة المرور هنا
                          },
                          child: Text(
                            'Forget Password',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Spacer(),
                        SizedBox(
                          width: 170,
                          child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => Notes_view()));
                              } else {
                                return null;
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            child: Text('Login',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Register Now - ',
                          style: TextStyle(color: Colors.white),
                        ),
                        IconButton(
                          icon: Icon(Icons.facebook, color: Colors.blue),
                          onPressed: () {
                            // وظيفة التسجيل عبر فيسبوك
                          },
                        ),
                        IconButton(
                          icon:
                              Icon(Icons.gpp_good_outlined, color: Colors.blue),
                          onPressed: () {
                            // وظيفة التسجيل عبر تويتر
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.g_mobiledata, color: Colors.red),
                          onPressed: () {
                            // وظيفة التسجيل عبر Google+
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ],
      ),
    );
  }
}
