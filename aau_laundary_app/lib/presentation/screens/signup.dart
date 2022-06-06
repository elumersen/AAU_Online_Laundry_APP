// ignore_for_file: prefer_const_constructors
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsersignUpPage extends StatefulWidget {
  @override
  State<UsersignUpPage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UsersignUpPage> {
  var emailController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  key:ValueKey("first button"),
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(
                      Icons.email_outlined,
                    ),
                  ),
                ),
                // SizedBox(height: 20),
                // TextFormField(
                //   style: TextStyle(fontSize: 20, color: Colors.grey),
                //   decoration: InputDecoration(
                //     labelText: 'Phone Number',
                //     border: OutlineInputBorder(),
                //   ),
                // ),
                SizedBox(height: 20),
                TextFormField(
                  key: ValueKey("second key"),
                  controller: passController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(
                      Icons.key,
                    ),
                  ),
                ),
                SizedBox(height: 45),
                Container(
                  height: 40,
                  width: 250,
                  child: Material(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.green,
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () {
                        signUp();
                      },
                      child: Center(
                        child: Text(
                          "SIGN UP",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Creating Function to call the Sign in POST API
  Future<void> signUp() async {
    print('nbhjdj');
    if (passController.text.isNotEmpty && emailController.text.isNotEmpty) {
      var response = await http.post(Uri.parse("uri"),
          body: ({
            'email': emailController.text,
            'password': passController.text
          }));
      print(response.body);
      if (response.statusCode == 200) {
        //  TO DO
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid Credential")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Blank filed is not allowed")));
    }
  }
}