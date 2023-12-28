import 'package:flutter/material.dart';
import 'DemoScreen5.dart';
import 'PlanBook5.dart';

class TakeAssessment5 extends StatefulWidget {
  const TakeAssessment5({super.key});

  @override
  State<TakeAssessment5> createState() => _TakeAssessment5State();
}

class _TakeAssessment5State extends State<TakeAssessment5> {
  int detail = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Appointment Details',
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
                    'Get a demo session',
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
                    'Book a Plan',
                    style: TextStyle(
                      color: detail == 0 ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            detail == 1 ? DemoScreen() : PlanBook(),
          ],
        ),
      ),
    );
  }
}
