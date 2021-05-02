import 'package:flutter/material.dart';
import 'package:flutter_auth/components/text_field_container.dart';

class RoundedInputEmailField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onSaved;
  final ValueChanged<String> onChanged;
  final TextInputType keyboardType;

  const RoundedInputEmailField(
      {Key key,
      this.hintText,
      this.icon = Icons.mail_outline_rounded,
      this.onSaved,
      this.keyboardType,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onSaved: onSaved,
        onChanged: onChanged,
        keyboardType: keyboardType,
        cursorColor: Colors.purple,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.purple,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
