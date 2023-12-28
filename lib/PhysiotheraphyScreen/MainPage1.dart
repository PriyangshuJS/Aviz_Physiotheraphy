import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:usersidefirebase/widgets/viewAll.dart';

import '../widgets/doc_card.dart';
import '../widgets/serviceCard.dart';

class MainPage1 extends StatelessWidget {
  MainPage1({super.key});
  final CollectionReference _packCollection =
      FirebaseFirestore.instance.collection('packages');
  final CollectionReference _docCollection =
      FirebaseFirestore.instance.collection('DocDetail');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Physiotherapy',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black.withOpacity(0.800000011920929),
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.location_on_outlined,
                color: Color(0xFFF83D5B),
              ),
            ),
            const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.notifications_outlined,
                color: Color(0xFFF83D5B),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 354,
              height: 107,
              decoration: ShapeDecoration(
                gradient: const LinearGradient(
                  begin: Alignment(-1.00, 0.07),
                  end: Alignment(1, -0.07),
                  colors: [Color(0xFF0EB3F1), Color(0xFF6ADAFC)],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/p1.png',
                      fit: BoxFit.fill,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Don’ know which plan to opt for? \nTake this assessment and get \nsuggestions..\n',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                          height: MediaQuery.of(context).size.height / 30,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF83D5B),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          child: const Center(
                            child: Text(
                              'Take assessment',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2.7,
                  height: 44,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF3F3F3),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  child: const Center(
                    child: Text(
                      'Book Appointment',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2.7,
                  height: 44,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF3F3F3),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  child: const Center(
                    child: Text(
                      'Book Clinic Visit',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Category',
              style: TextStyle(
                color: Color(0xFFF83D5B),
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyBoxWidget(title: 'Box 1', imagePath: 'assets/s1.png'),
                    MyBoxWidget(title: 'Box 2', imagePath: 'assets/s2.png'),
                    MyBoxWidget(title: 'Box 3', imagePath: 'assets/s3.png'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyBoxWidget(title: 'Box 4', imagePath: 'assets/s4.png'),
                    MyBoxWidget(title: 'Box 5', imagePath: 'assets/s5.png'),
                    MyBoxWidget(title: 'Box 6', imagePath: 'assets/s6.png'),
                  ],
                ),
              ],
            ),
            ViewAll(title: "Packages"),
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
            const SizedBox(height: 10),
            ViewAll(title: "One day sessions"),
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
          ],
        ),
      )),
    );
  }
}

class MyBoxWidget extends StatelessWidget {
  final String title;
  final String imagePath;

  const MyBoxWidget({required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 4.5,
          height: MediaQuery.of(context).size.height / 10,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
          margin: const EdgeInsets.all(8),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
