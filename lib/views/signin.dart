import 'package:flutter/material.dart';


class SignIn extends StatefulWidget {
  final Function toggle;
  const SignIn(this.toggle);



  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Column(
            children: const <Widget>[
              CircleAvatar(
                radius: 28.0,
                backgroundImage: AssetImage( 'assets/images/SK.jpg'),
                ),
            ],
          ),
        ),
        body:  Container(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(
                      color: Colors.white54,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white54),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white54),
                    ),
                  ),
                ),
                const TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                      hintText: "Password",
                    hintStyle: TextStyle(
                      color: Colors.white54,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white54),
                    ),
                  ),
                ),
               const SizedBox(height: 30,),
                Container(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8,),
                    child: const Text('Forgot Password?',
                      style: TextStyle(
                        color: Colors.white,
                      ),),
                  ),
                ),
                const SizedBox(height: 30,),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xff1DE9B6),
                        Color(0xFFE040FB)
                      ]
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text("Sign In",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        colors: [
                          Color(0xff1DE9B6),
                          Color(0xFFE040FB)
                        ]
                    ),
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: const Text("Sign In with Google",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have account?", style: TextStyle(
                     color: Colors.white,
                    ),
                    ),
                    GestureDetector(
                      onTap: (){
                        widget.toggle();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: const Text("Register now", style: TextStyle(
                        color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50,)
              ],
            ),
          ),
        ),
      );
  }
}
