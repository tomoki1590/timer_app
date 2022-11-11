import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:timer_image_app/acount/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('新規登録'),
        ),
        body: SingleChildScrollView(
            child: Center(
                child: Column(children: [
          SizedBox(
            width: 300,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: TextField(
                decoration: const InputDecoration(hintText: "メールアドレス"),
                onChanged: (String value) {
                  setState(() {
                    emailController.text = value;
                  });
                },
              ),
            ),
          ),
          SizedBox(
            width: 300,
            child: TextField(
              decoration: const InputDecoration(labelText: 'パスワード'),
              obscureText: true,
              onChanged: (String value) {
                setState(() {
                  passwordController.text = value;
                });
              },
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                try {
                  // メール/パスワードでログイン
                  final User? user = (await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text))
                      .user;
                  if (user != null) {
                    print("登録しました！！${user.email} , ${user.uid}");
                  }
                } catch (e) {
                  print(e);
                }
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Login()));
              },
              child: const Text('登録'))
        ]))));
  }
}
