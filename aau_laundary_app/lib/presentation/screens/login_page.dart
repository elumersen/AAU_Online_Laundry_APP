import 'package:aau_laundary_app/blocs/Authentication/bloc/login_bloc.dart';
import 'package:aau_laundary_app/blocs/Authentication/form_submission_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
// import 'package:formz/formz.dart';

// import '../auth/bloc/login_bloc.dart';
// import '../auth/form_submission_status.dart';
// import '../blocs/Authentication/bloc/login_bloc.dart';
// import '../blocs/Authentication/form_submission_status.dart';
// import '../bloc/login_bloc.dart';

class LoginPageScreen extends StatefulWidget {
  const LoginPageScreen({Key? key}) : super(key: key);

  @override
  State<LoginPageScreen> createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (_formkey.currentState!.validate()) {
          var status = state.status;
          if (status is SubmittingSuccess) {
            _snackBar(context, "LogIn Success");
            print("going to profi");
            if(status.role=='ADMIN'){
              context.go('/admin');
            }
            else{
              context.go("/userProfile");
            }
            
          }
          if (status is SubmittingFailure) {
            var msg = state.status;
            _snackBar(context, status.exception);
            // context.read<LoginBloc>().add(const LoginSubmitted());
          }
        }
      },
      child: Scaffold(
        body: Form(
          key: _formkey,
          child: Center(
            child: SizedBox(
              width: 300,
              child: ListView(
                padding: const EdgeInsets.only(top: 50),
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 300,
                        height: 200,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/Login_img.webp"),
                          ),
                        ),
                      ),

                      // const Icon(Icons.person_pin, size: 90),
                      const Text(
                        "Welcome back!",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const Text("Login to continue"),
                      const SizedBox(height: 30),
                      _UserIdInput(),
                      const Padding(padding: EdgeInsets.all(12)),
                      _PasswordInput(),
                      const Padding(padding: EdgeInsets.all(12)),
                      _LoginButton(_formkey),

                      const SizedBox(height: 30),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      GestureDetector(
                        onTap: () => context.go("/signUp"),
                        child: const Text(
                          " SIGN UP",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
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

class _UserIdInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.userId != current.userId,
      builder: (context, state) {
        return TextFormField(
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
            icon: Icon(Icons.person_outline),
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
              context.read<LoginBloc>().add(LoginUserIdChanged(userId)),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextFormField(
          validator: (value) {
            if (value!.length < 8) {
              return "Invalid password";
            } else {
              return null;
            }
          },
          //  =>
          //     state.isPasswordValid ? null : "Invalid Password",
          cursorColor: Colors.black,
          maxLength: 20,
          decoration: const InputDecoration(
            // errorText: state.password ? 'invalid password' : null,
            icon: Icon(Icons.lock),
            labelText: 'password',
            labelStyle: TextStyle(
              color: Color.fromARGB(255, 17, 17, 17),
            ),
            suffixIcon: Icon(Icons.remove_red_eye_outlined),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
          onChanged: (password) =>
              context.read<LoginBloc>().add(LoginPasswordChanged(password)),
        );
      },
    );
  }
}

Widget _LoginButton(_formkey) {
  // @override
  // Widget build(BuildContext context) {
  return BlocBuilder<LoginBloc, LoginState>(
    buildWhen: (previous, current) => previous.status != current.status,
    builder: (context, state) {
      return state.status is FormSubmitting
          ? const CircularProgressIndicator()
          : ElevatedButton(
              onPressed: () {
                if (_formkey.currentState.validate()) {
                  context.read<LoginBloc>().add(const LoginSubmitted());
                  var status = state.status;
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: const Text("SIGN IN"),
            );
    },
  );
}
// }

void _snackBar(context, message) {
  Color color;
  message == "LogIn Success" ? color = Colors.blue : color = Colors.red;
  final snackBar = SnackBar(
    backgroundColor: color,
    content: Text('$message'),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // context.go("/signUp");
}
