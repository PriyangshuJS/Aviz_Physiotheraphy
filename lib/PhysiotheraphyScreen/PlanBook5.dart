import 'package:flutter/material.dart';

import '../widgets/conformButton.dart';
import '../widgets/genderIcon.dart';

class PlanBook extends StatelessWidget {
  const PlanBook({super.key});
  String _getCurrentTime() {
    DateTime now = DateTime.now();
    return '${now.hour}:${now.minute} ${now.hour >= 12 ? 'PM' : 'AM'}';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Duration of service:',
              style: TextStyle(
                color: Colors.black.withOpacity(0.800000011920929),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2.7,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Start date',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        const Icon(Icons.calendar_month_outlined),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2.7,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'End date',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        const Icon(Icons.calendar_month_outlined),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            const Opacity(
              opacity: 0.50,
              child: Text(
                'Select Time:',
                style: TextStyle(
                  color: Color(0xFF0D0D0D),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: 169,
              height: 40,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    _getCurrentTime(),
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.access_time,
                    size: 20,
                    color: Color(0xFFF83D5B),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Explain problem in detail: ',
              style: TextStyle(
                color: Colors.black.withOpacity(0.800000011920929),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: 354,
              height: 63,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Opacity(
                  opacity: 0.50,
                  child: Text(
                    textAlign: TextAlign.left,
                    'Write here..',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.800000011920929),
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Prefered Doctor: ',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black.withOpacity(0.800000011920929),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Gendericon(gendericon: "assets/mdi_face-male.png"),
                Gendericon(gendericon: "assets/mdi_face-female.png"),
                Gendericon(gendericon: "assets/Ellipse 666.png"),
                SizedBox(width: MediaQuery.of(context).size.width / 5),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Active mobile number:',
              style: TextStyle(
                color: Colors.black.withOpacity(0.800000011920929),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Enter detail address:',
              style: TextStyle(
                color: Colors.black.withOpacity(0.800000011920929),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ConformButton(conformText: "Book Appointment"),
            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
