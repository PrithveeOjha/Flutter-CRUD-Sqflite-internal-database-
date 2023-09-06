import 'package:flutter/material.dart';
class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('images/background.jpg'), fit: BoxFit.cover),),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 260),
                child: Row(
                  children: [
                    Text(
                      "Skip",
                      style: TextStyle(
                          fontSize: 27, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(radius: 25,
                      backgroundColor: Colors.black12,
                      child: IconButton(
                        onPressed: (){Navigator.pushNamed(context, 'signup');},
                        icon: Icon(Icons.arrow_forward, color: Colors.black87,),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(77),
                child: Container(
                  child: Column(
                    children: [
                     CircleAvatar(backgroundImage: AssetImage('images/gura.jpg'), radius: 100,),
                    ],
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                   crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextButton(
                        child: Container(
                          child: Text(
                            'Sign in with Google',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, 'signup');
                        },
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      TextButton(
                        child: Container(
                          child: Text(
                            'Sign in with Apple',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black54),
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      TextButton(
                        child: Container(
                          child: Text(
                            'Sign in with GitHub',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black87),
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      TextButton(
                        child: Container(
                          child: Text(
                            'Sign in with Microsoft',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blueAccent),
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 1,
                      ),
                    SizedBox(height: 10,),
                    Text('By "clicking Sign in with Google/Apple/GitHub/Microsoft" above you agree to Terms and Conditions and Policy.')
                    ],
                  ),
                ),
              )
              ]
          ),
        ),
      ),
    );
  }
}
