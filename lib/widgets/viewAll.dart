import 'package:flutter/material.dart';

class ViewAll extends StatelessWidget {
  String title;

  ViewAll({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Color(0xFFF83D5B),
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        const TextButton(
          onPressed: null,
          child: Text(
            'View All',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFF83D5B),
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
              decorationColor: Color.fromARGB(255, 255, 48, 92),
              height: 0.15,
            ),
          ),
        ),
      ],
    );
  }
}
