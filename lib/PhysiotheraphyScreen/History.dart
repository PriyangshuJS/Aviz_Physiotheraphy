import 'package:flutter/material.dart';

class History9 extends StatefulWidget {
  const History9({super.key});

  @override
  State<History9> createState() => _History9State();
}

class _History9State extends State<History9> {
  List<bool> completedDays = List.generate(7, (index) => false);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '2 Weeks Orthopedic Plan',
            style: TextStyle(
              color: Colors.black.withOpacity(0.800000011920929),
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Text(
                'Physiotherapist assigned: ',
                style: TextStyle(
                  color: Color(0xFFF83D5B),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              Text(
                'Dr Amit Agarwal',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.800000011920929),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(right: 20, left: 10, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Day',
                  style: TextStyle(
                    color: Color(0xFFF83D5B),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                Text(
                  'Status',
                  style: TextStyle(
                    color: Color(0xFFF83D5B),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Column(
              children: List.generate(
                  7,
                  (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Day ${index + 1}'),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  completedDays[index] = !completedDays[index];
                                });
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  completedDays[index]
                                      ? Colors.green
                                      : Colors.grey,
                                ),
                              ),
                              child: const Text('Completed'),
                            ),
                          ],
                        ),
                      )))
        ],
      ),
    );
  }
}
