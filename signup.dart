import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled1/database__handler.dart';
import 'package:untitled1/user_model.dart';
import 'package:untitled1/user_repo.dart';

class MySignup extends StatefulWidget {
  const MySignup({super.key});

  @override
  State<MySignup> createState() => _MySignupState();
}

class _MySignupState extends State<MySignup> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Database? _database;

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //       image: AssetImage('images/background.jpg'), fit: BoxFit.cover),
      // ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.black12,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Sign in",
                            style: TextStyle(
                                fontSize: 27, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('images/gura.jpg'),
                          radius: 75,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0),
                            ),
                            hintText: 'Email',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0),
                            ),
                            hintText: 'Password',
                          ),
                          obscureText: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 220),
                        child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'login');
                            },
                            child: Text("Forgot Password?")),
                      ),
                      TextButton(
                        child: Container(
                          child: Text(
                            '         Sign in        ',
                            style: TextStyle(color: Colors.white, fontSize: 21),
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () {
                          insertDB();
                          getFromUser();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 68),
                        child: Row(
                          children: [
                            Text("Don't have an account?"),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'login');
                                },
                                child: Text("Sign up")),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Database?> openDB() async {
    _database = await DatabaseHandler().openDB();
    return _database;
  }

  Future<void> insertDB() async {
    _database = await openDB();
    UserRepo userRepo = UserRepo();
    userRepo.createTable(_database);

    UserModel userModel = new UserModel(
        emailController.text.toString(), passwordController.text.toString());

    await _database?.insert('user', userModel.toMap());
    await _database?.close();
  }

  Future<void> getFromUser() async {
    _database = await openDB();
    UserRepo userRepo = new UserRepo();
    await userRepo.getUsers(_database);
    await _database?.close();
  }
}
