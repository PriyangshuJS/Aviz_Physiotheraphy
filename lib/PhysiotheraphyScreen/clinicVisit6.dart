import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/calender.dart';
import '../widgets/conformButton.dart';
import '../widgets/serviceCard.dart';

class ClinicVisit extends StatefulWidget {
  const ClinicVisit({super.key});

  @override
  State<ClinicVisit> createState() => _ClinicVisitState();
}

class _ClinicVisitState extends State<ClinicVisit> {
  String _getCurrentTime() {
    DateTime now = DateTime.now();
    return '${now.hour}:${now.minute} ${now.hour >= 12 ? 'PM' : 'AM'}';
  }

  final CollectionReference _packCollection =
      FirebaseFirestore.instance.collection('packages');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Clinic Visit',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black.withOpacity(0.800000011920929),
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          )),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Available doctors:',
              style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            const SizedBox(height: 10),
            StreamBuilder<QuerySnapshot>(
              stream: _packCollection.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }

                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Text('No data available');
                }
                final data =
                    snapshot.data!.docs.first.data() as Map<String, dynamic>;

                return ServiceCard(
                  data: data,
                );
              },
            ),
            const SizedBox(height: 20),
            const Opacity(
              opacity: 0.50,
              child: Text(
                'Select date:',
                textAlign: TextAlign.center,
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
            const Calender(),
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
            const SizedBox(height: 30),
            ConformButton(conformText: "BOOK")
          ],
        ),
      )),
    );
  }
}
