import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:timer_image_app/acount/sign_up.dart';
import 'package:timer_image_app/home_page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ログイン"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
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
                  decoration: const InputDecoration(hintText: 'パスワード'),
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
                              .signInWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text))
                          .user;
                      if (user != null) {
                        print("ログインしました　${user.email} , ${user.uid}");
                      }
                    } catch (e) {
                      print(e);
                    }
                    Navigator.pop(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  },
                  child: const Text('ログイン')),
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text("初めての方はこちらから"),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUp()));
                  },
                  child: const Text("新規登録")),

              ///TODOログイン処理
              SignInButton(Buttons.Google,
                  text: "Sign up with Google", onPressed: () {}),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SignInButton(
                  Buttons.Apple,
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SignInButton(
                  Buttons.Email,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
