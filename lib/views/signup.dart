import 'package:flutter/material.dart';
import 'package:skapp/services/auth.dart';
import 'package:skapp/services/database.dart';

import 'chat_screen.dart';

class SignUp extends StatefulWidget {
  final Function toggle;
    const SignUp(this.toggle);


  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

    bool isLoading = false;

    AuthMethods authMethods = AuthMethods();
    DatabaseMethods databaseMethods = DatabaseMethods();

    final formKey = GlobalKey<FormState>();
    TextEditingController userNameTextEditingController = TextEditingController();
    TextEditingController emailTextEditingController = TextEditingController();
    TextEditingController passwordTextEditingController = TextEditingController();

    signMeUp(){
      if(formKey.currentState!.validate()){
        Map<String, String> userInfoMap = {
          "name" : userNameTextEditingController.text,
          "email" : emailTextEditingController.text
        };
        setState(() {
         isLoading = true;
        });
        authMethods.signInWithEmailAndPassword(emailTextEditingController.text,
            passwordTextEditingController.text).then((val){
          //print("${val.uid}");



          databaseMethods.uploadUserInfo(userInfoMap);
          Navigator.pushReplacement(context, MaterialPageRoute(
           builder: (context) =>  const ChatRoom()
          ));
        });
      }

    }

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
      body: isLoading ? const Center(child: CircularProgressIndicator()):
      Container(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator:  (val){
   return val!.isEmpty || val.length < 2 ? "Please Provide a valid username" : null;
                      },
                      controller: userNameTextEditingController,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                        hintText: "Username",
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
                    TextFormField(
                      validator: (val){
                        return RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(val!) ? null : "Please provide a valid email";
                      },
                      controller: emailTextEditingController,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
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
                    TextFormField(
                      obscureText: true,
                      validator: (val){
                        return val!.length > 6 ? null : "Please provide password 6+ character";
                      },
                      controller: passwordTextEditingController,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(
                          color: Colors.white54,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54),
                        ),
                      ),
                    ),
                  ],
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
              GestureDetector(
                onTap: (){
                  signMeUp();
                },
                child: Container(
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
                  child: const Text("Sign Up",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
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
                child: const Text("Sign Up with Google",
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
                  const Text("Already have account?", style: TextStyle(
                    color: Colors.white,
                  ),
                  ),
                  GestureDetector(
                    onTap: (){
                      widget.toggle();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text("SignIn now", style: TextStyle(
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
