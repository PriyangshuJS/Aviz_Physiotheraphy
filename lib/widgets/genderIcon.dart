import 'package:flutter/material.dart';

class Gendericon extends StatelessWidget {
  String gendericon;

  Gendericon({super.key, required this.gendericon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(
          color: Colors.red, // Set your desired border color
          width: 2, // Set your desired border width
        ),
      ),
      child: GestureDetector(
        onTap: () {
          print("Container clicked");
        },
        child: Center(
          child: Image.asset(
            gendericon,
            color: Color.fromARGB(255, 255, 48, 92),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
