import 'package:flutter/material.dart';
import 'package:flutter_auth/components/text_field_container.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onSaved;
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({Key key, this.onSaved, this.onChanged})
      : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool secureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: secureText,
        onSaved: widget.onSaved,
        onChanged: widget.onChanged,
        cursorColor: Colors.purple,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: Colors.purple,
          ),
          suffixIcon: IconButton(
            splashColor: Colors.transparent,
            icon: Icon(Icons.visibility),
            color: Colors.purple,
            onPressed: () {
              setState(() {
                secureText = !secureText;
              });
            },
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
