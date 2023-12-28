import 'package:flutter/material.dart';
import 'Current9.dart';
import 'DemoScreen5.dart';
import 'History.dart';
import 'PlanBook5.dart';

class OrthoPhysio extends StatefulWidget {
  const OrthoPhysio({super.key});

  @override
  State<OrthoPhysio> createState() => _OrthoPhysioState();
}

class _OrthoPhysioState extends State<OrthoPhysio> {
  int detail = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Orthopedic Physiotherapy',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF202020),
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      detail = 1;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        detail == 1 ? Color(0xFFF83D5B) : Color(0xFFF3F3F3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text(
                    'Current',
                    style: TextStyle(
                      color: detail == 1 ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      detail = 0;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        detail == 0 ? Color(0xFFF83D5B) : Color(0xFFF3F3F3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text(
                    'History',
                    style: TextStyle(
                      color: detail == 0 ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            detail == 1 ? Current() : History9(),
          ],
        ),
      ),
    );
  }
}
