import 'package:flutter/material.dart';

class ConformButton extends StatelessWidget {
  String conformText;
  ConformButton({super.key, required this.conformText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          // Handle the assessment button click
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF83D5B),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          shadowColor: const Color(0x9C878787),
          elevation: 5,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            conformText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
