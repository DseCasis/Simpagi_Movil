// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:practica_1/src/pages/menu_lateral.dart';
import 'package:practica_1/src/widgets/input_text.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  late String _email;
  late String _password;
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Center(
      child: Column(
        children: <Widget>[
          InputText(
              hint: "Email Addres",
              label: "Email",
              keyboard: TextInputType.emailAddress,
              icono: const Icon(Icons.verified_user),
              onChanged: (data) {
                _email = data!;
              },
              validator: (data) {
                if (data!.contains("@")) {
                  return 'email invalido';
                }
                return null!;
              }),
          Divider(
            height: 20.0,
          ),
          InputText(
              hint: "password",
              label: "password",
              obsecure: false,
              icono: const Icon(Icons.lock_clock),
              onChanged: (data) {
                _password = data!;
              },
              validator: (data) {
                if (data?.trim().length == 0) {
                  return 'password invalido';
                }
                return null!;
              }),
          Divider(
            height: 30.0,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: Text(
                  "Ingresar",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "FreeokaOne",
                    fontSize: 30.0,
                  ),
                )),
          ),
        ],
      ),
    ));
  }
}
