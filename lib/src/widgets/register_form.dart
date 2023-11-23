import 'package:flutter/material.dart';
import 'package:practica_1/src/widgets/input_text.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<RegisterForm> {
  late String _user;
  late num _cedula;
  late String _email;
  late String _password;
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Center(
      child: Column(
        children: <Widget>[
          InputText(
              hint: "User",
              label: "User",
              keyboard: TextInputType.emailAddress,
              icono: const Icon(Icons.account_circle),
              onChanged: (data) {
                _email = data!;
              },
              validator: (data) {
                if (data!.contains("@")) {
                  return 'User Invalido';
                }
                return null!;
              }),
          Divider(
            height: 20.0,
          ),
          InputText(
              hint: "Cedula",
              label: "Cedula",
              obsecure: false,
              keyboard: TextInputType.numberWithOptions(),
              icono: const Icon(Icons.article),
              onChanged: (data) {
                _password = data!;
              },
              validator: (data) {
                if (data?.trim().length == 0) {
                  return 'Cedula invalida';
                }
                return null!;
              }),
          Divider(
            height: 20.0,
          ),
          InputText(
              hint: "Email",
              label: "Email",
              obsecure: false,
              icono: const Icon(Icons.attach_email),
              onChanged: (data) {
                _password = data!;
              },
              validator: (data) {
                if (data?.trim().length == 0) {
                  return 'Email invalido';
                }
                return null!;
              }),
          Divider(
            height: 20.0,
          ),
          InputText(
              hint: "Password",
              label: "Password",
              obsecure: false,
              icono: const Icon(Icons.lock_clock),
              onChanged: (data) {
                _password = data!;
              },
              validator: (data) {
                if (data?.trim().length == 0) {
                  return 'Contraseña invalida';
                }
                return null!;
              }),
          Divider(
            height: 30.0,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {},
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
