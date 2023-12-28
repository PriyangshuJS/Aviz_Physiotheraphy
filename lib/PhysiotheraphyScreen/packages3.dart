import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/doc_card.dart';
import '../widgets/serviceCard.dart';
import '../widgets/viewAll.dart';

class Packages3 extends StatefulWidget {
  const Packages3({Key? key});

  @override
  State<Packages3> createState() => _Packages3State();
}

class _Packages3State extends State<Packages3> {
  final CollectionReference _docCollection =
      FirebaseFirestore.instance.collection('DocDetail');
  final CollectionReference _packCollection =
      FirebaseFirestore.instance.collection('packages');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Packages ',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black.withOpacity(0.8),
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            ViewAll(title: "Packages"),
            const SizedBox(height: 5),
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
            const SizedBox(height: 10),
            ViewAll(title: "Physiotherapists near you"),
            SizedBox(
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width,
              child: StreamBuilder<QuerySnapshot>(
                stream: _docCollection.snapshots(),
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
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var data = snapshot.data!.docs[index].data()
                          as Map<String, dynamic>;

                      return DocCard(data: data);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
