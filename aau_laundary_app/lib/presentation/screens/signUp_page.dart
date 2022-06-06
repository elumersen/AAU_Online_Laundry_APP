import 'package:aau_laundary_app/blocs/SignUp/bloc/signup_bloc.dart';
import 'package:aau_laundary_app/blocs/SignUp/form_submission_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
// import 'package:proj/Models/user.dart';
// import 'package:proj/blocs/SignUp/bloc/signup_bloc.dart';

// import '../blocs/SignUp/form_submission_status.dart';
// import '../data_providers/userDataProvider/userRemoteDataProvider.dart';
// import '../repository/userRepository.dart';

class SignUpPageScreen extends StatefulWidget {
  const SignUpPageScreen({Key? key}) : super(key: key);

  @override
  State<SignUpPageScreen> createState() => _SignUpPageScreenState();
}

class _SignUpPageScreenState extends State<SignUpPageScreen> {
  final _formkey = GlobalKey<FormState>();
  // var emailController = TextEditingController();
  // var passwordController = TextEditingController();
  // var phoneNumberController = TextEditingController();
  // var usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (_formkey.currentState!.validate()) {
          final status = state.status;
          if (status is SubmittingFailure) {
            var msg = state.status;
            _snackBar(context, status.exception);
            // context.read<SignUpBloc>().add(const SignUpSubmitted());
          }
          if (status is SubmittingSuccess) {
            _snackBar(context, "Sign Up Success");
            context.go("/logIn");
          }
        }
      },
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text("Sign UP"),
        // ),
        body:
            //BlocListener<SignUpBloc, SignUpState>(
            //   listener: (context, state) {
            //     print(state.status);
            //
            //     if (status is SubmittingFailure) {
            //       _snackBar(context, status.exception);
            //       // context.go("/signUp");
            //     }
            //   },
            // child:
            Form(
          key: _formkey,
          child: Center(
            child: SizedBox(
              // width: 400,
              child: ListView(
                padding: const EdgeInsets.only(top: 10),
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 300,
                        height: 150,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("./Login_img_1.jpg"),
                          ),
                        ),
                      ),
                      const Text(
                        "Hello! there",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const Text("Don't have an account? SIGN UP here"),
                      const SizedBox(height: 30),
                      _UsernameInput(),
                      const Padding(padding: EdgeInsets.all(12)),
                      _UserIdInput(),
                      // const Padding(padding: EdgeInsets.all(12)),
                      // _EmailInput(),
                      const Padding(padding: EdgeInsets.all(12)),
                      _PhoneNumberInput(),
                      const Padding(padding: EdgeInsets.all(12)),
                      _PasswordInput(),
                      const Padding(padding: EdgeInsets.all(12)),
                      _SignUpButton(_formkey, context),
                      const SizedBox(height: 30),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Have an account?",
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                                onTap: () => context.go("/logIn"),
                                child: const Text("Sign In",
                                    style: TextStyle(color: Colors.blue)))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: ElevatedButton(
                          child: const Text("Back to Home"),
                          onPressed: () {
                            context.go("/");
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // }
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return SizedBox(
          width: 350,
          child: TextFormField(
            // controller: usernameController;
            validator: (value) {
              if (value!.length < 4) {
                return "Invalid username";
              } else {
                return null;
              }
            },
            // state.isUsernameValid ? null : "Invalid username",
            cursorColor: Colors.black,
            maxLength: 20,
            decoration: const InputDecoration(
              // errorText: state.username.invalid ? 'invalid username' : null,
              icon: Icon(Icons.person_outline),
              focusColor: Colors.green,
              fillColor: Colors.green,
              labelText: 'Username',
              labelStyle: TextStyle(
                color: Color.fromARGB(255, 18, 18, 19),
              ),
              suffixIcon: Icon(
                Icons.check_circle,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
            onChanged: (username) =>
                context.read<SignUpBloc>().add(SignUpUsernameChanged(username)),
          ),
        );
      },
    );
  }
}

class _UserIdInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return SizedBox(
          width: 350,
          child: TextFormField(
            validator: (value) {
              if (value!.length < 4) {
                return "Invalid userId";
              } else {
                return null;
              }
            },
            // => state.isUserIdValid ? null : "Invalid userId",
            cursorColor: Colors.black,
            maxLength: 20,
            decoration: const InputDecoration(
              // errorText: state.username.invalid ? 'invalid username' : null,
              icon: Icon(Icons.inventory_rounded),
              focusColor: Colors.green,
              fillColor: Colors.green,
              labelText: 'UserId',
              labelStyle: TextStyle(
                color: Color.fromARGB(255, 18, 18, 19),
              ),
              suffixIcon: Icon(
                Icons.check_circle,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
            onChanged: (userId) =>
                context.read<SignUpBloc>().add(SignUpUserIdChanged(userId)),
          ),
        );
      },
    );
  }
}

// class _EmailInput extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SignUpBloc, SignUpState>(
//       buildWhen: (previous, current) => previous.username != current.username,
//       builder: (context, state) {
//         return SizedBox(
//           width: 350,
//           child: TextFormField(
//             validator: (value) =>
//                 state.isEmailValid ? null : "Invalid email address",
//             cursorColor: Colors.black,
//             maxLength: 20,
//             decoration: const InputDecoration(
//               // errorText: state.username.invalid ? 'invalid username' : null,
//               icon: Icon(
//                 Icons.mail_outline_sharp,
//               ),
//               focusColor: Colors.green,
//               fillColor: Colors.green,
//               labelText: 'email',
//               labelStyle: TextStyle(
//                 color: Color.fromARGB(255, 18, 18, 19),
//               ),
//               suffixIcon: Icon(
//                 Icons.check_circle,
//               ),
//               border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(20))),
//             ),
//             onChanged: (email) =>
//                 context.read<SignUpBloc>().add(SignUpEmailChanged(email)),
//           ),
//         );
//       },
//     );
//   }
// }

class _PhoneNumberInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return SizedBox(
          width: 350,
          child: TextFormField(
            validator: (value) {
              if (value!.length < 4) {
                return "Invalid phoneNumber";
              } else {
                return null;
              }
            },
            // =>
            //     state.isPhoneNumberValid ? null : "Invalid phoneNumber",
            cursorColor: Colors.black,
            maxLength: 20,
            decoration: const InputDecoration(
              // errorText: state.username.invalid ? 'invalid username' : null,
              icon: Icon(Icons.phone),
              focusColor: Colors.green,
              fillColor: Colors.green,
              labelText: 'phoneNumber',
              labelStyle: TextStyle(
                color: Color.fromARGB(255, 18, 18, 19),
              ),
              suffixIcon: Icon(
                Icons.check_circle,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
            onChanged: (phoneNumber) => context
                .read<SignUpBloc>()
                .add(SignUpPhoneNumberChanged(phoneNumber)),
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return SizedBox(
          width: 350,
          child: TextFormField(
            validator: (value) {
              if (value!.length < 8) {
                return "Invalid password";
              } else {
                return null;
              }
            },
            // =>
            //     state.isPasswordValid ? null : "Invalid password",
            cursorColor: Colors.black,
            maxLength: 20,
            decoration: const InputDecoration(
              // errorText: state.username.invalid ? 'invalid username' : null,
              icon: Icon(Icons.lock),
              focusColor: Colors.green,
              fillColor: Colors.green,
              labelText: 'password',
              labelStyle: TextStyle(
                color: Color.fromARGB(255, 18, 18, 19),
              ),
              suffixIcon: Icon(
                Icons.check_circle,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
            onChanged: (password) =>
                context.read<SignUpBloc>().add(SignUpPasswordChanged(password)),
          ),
        );
      },
    );
  }
}

Widget _SignUpButton(_formkey, context) {
  return BlocBuilder<SignUpBloc, SignUpState>(
    // listener: (context, state) {

    // },
    buildWhen: (previous, current) => previous.status != current.status,
    builder: (context, state) {
      return state.status is FormSubmitting
          ? const CircularProgressIndicator()
          : SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState.validate()) {
                    context.read<SignUpBloc>().add(const SignUpSubmitted());
                    // final status = state.status;
                    // if (status is SubmittingFailure) {
                    //   var msg = state.status;
                    //   _snackBar(context, status.exception);
                    //   context
                    //       .read<SignUpBloc>()
                    //       .add(SignUpPasswordChanged(state.password));
                    // }
                    // if (status is SubmittingSuccess) {
                    //   _snackBar(context, "Sign Up Success");
                    //   context.go("/logIn");
                  }
                  // }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text("SIGN UP"),
              ),
            );
    },
  );
}

void _snackBar(context, message) {
  Color color;
  message == "Sign Up Success" ? color = Colors.blue : color = Colors.red;
  final snackBar = SnackBar(
    backgroundColor: color,
    content: Text('$message'),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // context.go("/signUp");
}
