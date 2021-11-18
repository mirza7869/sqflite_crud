import 'package:flutter/material.dart';

class InputField extends StatefulWidget {

  final String? hintText;
  final double? width;
  final TextEditingController? controller;
  late bool? isPassword;
  late IconData? icon;

   InputField({Key? key, this.hintText, this.width, this.controller, this.isPassword, this.icon}) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),

      width: widget.width ?? MediaQuery.of(context).size.width,
      height: 50,
      color: Colors.transparent,
      child: TextField(
        controller: widget.controller,
        obscureText: widget.isPassword ?? false,
        decoration: InputDecoration(
          hintText: widget.hintText,
          suffixIcon: IconButton(
            onPressed: (){
              setState(() {
                if(widget.isPassword!)
                {
                  widget.isPassword = false;
                  widget.icon = Icons.visibility_off;
                }
                else
                {
                  widget.isPassword = false;
                  widget.icon = Icons.visibility;
                }
              });
            },
            icon: Icon(widget.icon),
          )
        ),
      ),
    );
  }
}
