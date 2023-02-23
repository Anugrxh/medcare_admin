import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:medcare_admin/screens/home.dart';
import 'package:medcare_admin/widgets/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../blocs/auth/sign_in/sign_in_bloc.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "asset/image/bg.png",
              fit: BoxFit.cover,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Image.asset(
                  "asset/image/weca.png",
                ),
              ),
              Expanded(
                child: BlocProvider<SignInBloc>(
                  create: (context) => SignInBloc(),
                  child: BlocConsumer<SignInBloc, SignInState>(
                    listener: (context, state) {
                      if (state is SignInFailureState) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Login Failed"),
                          ),
                        );
                      } else if (state is SignInSuccessState) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const Home(),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      return Form(
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Login",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                      color: Color.fromARGB(255, 0, 5, 10),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40),
                            ),
                            SizedBox(
                              height: 100,
                            ),
                            SizedBox(
                              width: 300,
                              child: TextFormField(
                                controller: _emailController,
                                obscureText: false,
                                validator: (value) {
                                  if (value != null && value.isNotEmpty) {
                                    return null;
                                  } else {
                                    return "Please enter an email";
                                  }
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  labelText: 'email',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            SizedBox(
                              width: 300,
                              child: TextFormField(
                                controller: _passwordController,
                                obscureText: true,
                                validator: (value) {
                                  if (value != null && value.isNotEmpty) {
                                    return null;
                                  } else {
                                    return "Please enter password";
                                  }
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  labelText: 'password',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            CustomButton(
                              label: "Login",
                              buttonColor: Colors.white,
                              elevation: 5,
                              isLoading: state is SignInLoadingState,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  String email = _emailController.text.trim();
                                  String password =
                                      _passwordController.text.trim();

                                  BlocProvider.of<SignInBloc>(context).add(
                                    SignInEvent(
                                      email: email,
                                      password: password,
                                    ),
                                  );
                                }
                              },
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
