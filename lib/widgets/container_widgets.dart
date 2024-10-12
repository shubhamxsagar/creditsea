import 'package:credit_sea/Theme/theme.dart';
import 'package:credit_sea/widgets/carousel_widgets.dart';
import 'package:flutter/material.dart';
import 'shared_widgets.dart';

class DynamicContentWidget extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onNextButtonPressed;
  final VoidCallback onBackButtonPressed;

  const DynamicContentWidget({
    Key? key,
    required this.selectedIndex,
    required this.onNextButtonPressed,
    required this.onBackButtonPressed,
  }) : super(key: key);

  @override
  _DynamicContentWidgetState createState() => _DynamicContentWidgetState();
}

class _DynamicContentWidgetState extends State<DynamicContentWidget> {
  String mobileNumber = '';
  List<TextEditingController> otpControllers =
      List.generate(4, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    switch (widget.selectedIndex) {
      case 0:
        return _buildWelcomeScreen();
      case 1:
        return _buildOtpScreen();
      case 2:
        return _buildPasswordScreen();
      case 3:
        return _buildSignInScreen();
      default:
        return _buildWelcomeScreen();
    }
  }

  Widget _buildWelcomeScreen() {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height * 0.015,
              left: 0,
              right: 0,
              child: Center(
                child: buildBackButton(
                  widget.onBackButtonPressed,
                  Text("Welcome to Credit Sea"),
                  back: false,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.10,
              left: MediaQuery.of(context).size.width * 0.05,
              child: Text("Mobile Number"),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.13,
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
              child: buildMobileNumberInput((value) {
                setState(() {
                  mobileNumber = value;
                });
              }),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.22,
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
              child: buildCheckbox(true, (_) {}),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.3,
              left: 0,
              right: 0,
              child: Center(
                child: buildButton(
                    "Request OTP", () => widget.onNextButtonPressed(1)),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.37,
              left: 0,
              right: 0,
              child: Center(
                child: TextButton(
                  onPressed: () => widget.onNextButtonPressed(3),
                  child: Text(
                    "Existing User? Sign in",
                    style: TextStyle(color: ThemeColors.primaryColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtpScreen() {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height * 0.015,
              left: 0,
              right: 0,
              child: Center(
                child: buildBackButton(
                    widget.onBackButtonPressed, Text("Enter OTP")),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.10,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.08),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Verify OTP, Sent on $mobileNumber"),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(4, (index) {
                      return buildOtpBox(index);
                    }),
                  ),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.3,
              left: 0,
              right: 0,
              child: Center(
                child:
                    buildButton("Verify", () => widget.onNextButtonPressed(2)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordScreen() {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height * 0.015,
              left: 0,
              right: 0,
              child: Center(
                child: buildBackButton(
                    widget.onBackButtonPressed, Text("Create a Password")),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.10,
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text("Enter Password")),
                  InputField(hintText: 'Enter password'),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.22,
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text("Re Enter Password")),
                  InputField(hintText: 'Enter password'),
                  SizedBox(height: 5),
                  Text(
                      "*your password must include at least 8 characters, inclusive of alt least 1 special character")
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.4,
              left: 0,
              right: 0,
              child: Center(
                child:
                    buildButton("Proceed", () => widget.onNextButtonPressed(3)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignInScreen() {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height * 0.015,
              left: 0,
              right: 0,
              child: Center(
                child: buildBackButton(widget.onBackButtonPressed,
                    Text("Please enter your credentials"),
                    back: false),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.10,
              left: MediaQuery.of(context).size.width * 0.05,
              child: Text("Mobile Number"),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.13,
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
              child: buildMobileNumberInput(null),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.22,
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text("Enter Password")),
                  InputField(hintText: 'Enter password'),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text("Forgot Password?",
                        style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.363,
              left: 0,
              right: 0,
              child: Center(
                child:
                    buildButton("Proceed", () => widget.onNextButtonPressed(0)),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.42,
              left: 0,
              right: 0,
              child: Center(
                child: TextButton(
                  onPressed: () => widget.onNextButtonPressed(0),
                  child: Text(
                    "New to CreditSea? Create an account",
                    style: TextStyle(color: ThemeColors.primaryColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOtpBox(int index) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.15,
      height: MediaQuery.of(context).size.width * 0.15,
      child: TextField(
        controller: otpControllers[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: "",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < otpControllers.length - 1) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty && index > 0) {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }
}

Widget buildMobileNumberInput(ValueChanged<String>? onChanged) {
  return Row(
    children: [
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.network(
              'https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png',
              width: 20,
              height: 20,
            ),
            SizedBox(width: 5),
            Text("+91", style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
      Expanded(
        child: TextField(
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: 'Enter your mobile number',
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    ],
  );
}
