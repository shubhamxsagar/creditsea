import 'package:flutter/material.dart';

Widget buildButton(String text, VoidCallback onPressed) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20),
    width: double.infinity,
    height: 50,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    ),
  );
}

Widget buildCheckbox(bool isChecked, ValueChanged<bool?> onChanged) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Checkbox(value: isChecked, onChanged: onChanged),
      Expanded(
        child: Text(
          'By continuing, you agree to our privacy policy and terms.',
          softWrap: true,
          overflow: TextOverflow.visible,
        ),
      ),
    ],
  );
}

class InputField extends StatefulWidget {
  final String hintText;
  final bool obscureText;

  const InputField({
    Key? key,
    required this.hintText,
    this.obscureText = false,
  }) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
    _isObscure =
        widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _isObscure,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            _isObscure ? Icons.visibility_off : Icons.visibility,
            color: Colors.blue,
          ),
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
        ),
        hintText: widget.hintText,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

Widget buildBackButton(VoidCallback onBackPressed, Text text,
    {bool back = true}) {
  return Align(
    alignment: Alignment.topLeft,
    child: Row(
      children: [
        back
            ? IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.blue),
                onPressed: onBackPressed,
              )
            : SizedBox(),
        Expanded(
          child: Center(
            child: Text(
              text.data ?? "",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    ),
  );
}
