import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/conformButton.dart';
import '../widgets/paymentCard.dart';
import '../widgets/serviceCard.dart';

class BookAppointment7 extends StatefulWidget {
  const BookAppointment7({super.key});

  @override
  State<BookAppointment7> createState() => _BookAppointment7State();
}

class _BookAppointment7State extends State<BookAppointment7> {
  final CollectionReference _packCollection =
      FirebaseFirestore.instance.collection('packages');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Book Appointment',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black.withOpacity(0.800000011920929),
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    return CircularProgressIndicator();
                  }

                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Text('No data available');
                  }
                  final data =
                      snapshot.data!.docs.first.data() as Map<String, dynamic>;

                  return ServiceCard(
                    data: data,
                  );
                },
              ),
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: Colors.black.withOpacity(0.25),
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: paymentCard(
                    duration: 12,
                    service: "General Carre",
                    time: 12,
                    price: 500),
              ),
              const SizedBox(height: 30),
              ConformButton(conformText: "Pay now")
            ],
          ),
        ),
      ),
    );
  }
}
