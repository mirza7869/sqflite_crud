
import 'package:flutter/material.dart';
import 'package:sqflite_crud/util/db_helper.dart';
import 'package:sqflite_crud/widgets/widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  var dbHelper = DBHelper.instance;
  var emailController = TextEditingController();
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
            InputField(
              controller: usernameController,
              hintText: 'Enter username here',
            ),
          InputField(
            controller: emailController,
            hintText: 'Enter email here',
          ),
          InputField(
            controller: passwordController,
            hintText: 'Enter password here',
            isPassword: true,
          ),
          ElevatedButton(
            onPressed: () async
            {
              if(usernameController.text != '' && emailController.text != '' && passwordController.text != '' )
                {
                  //dbHelper.insertQuery("Insert into User (username, email, password) Values ('${usernameController.text}', '${emailController.text}', '${passwordController.text}')");
                  //dbHelper.updateQuery("Update User Set password = 'Pakistan12345' where id = '2'");
                  //dbHelper.deleteQuery("Delete From User Where id = '2'");
                  bool check = await dbHelper.userAuthenticate("Select * from user where email = '${emailController.text}' and password = '${passwordController.text}'");
                  if(check)
                    {
                      print('User is authenticated');
                    }
                  else
                    {
                      print("wrong username or password or account does not exists");
                    }
                }
            },
            child: const Text('Sign Up'),
          )
        ],
      )
    );
  }
}
