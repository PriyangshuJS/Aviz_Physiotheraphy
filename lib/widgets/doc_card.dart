import 'package:flutter/material.dart';

class DocCard extends StatefulWidget {
  final Map<String, dynamic> data;

  DocCard({
    required this.data,
  });

  @override
  State<DocCard> createState() => _DocCardState();
}

class _DocCardState extends State<DocCard> {
  @override
  Widget build(BuildContext context) {
    String name = widget.data["name"] ?? "Doctor";
    String specialization = widget.data["specialization"] ?? "Unknown";
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          shadows: const [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 8,
              offset: Offset(4, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.black,
                      ),
                      SizedBox(height: 10),
                      Text("4.2"),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0.30,
                        ),
                      ),
                      SizedBox(height: 10),
                      Opacity(
                        opacity: 0.70,
                        child: Text(
                          specialization,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 8,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  print('Container Clicked!');
                },
                child: Container(
                  width: MediaQuery.of(context).size.width /
                      5, // Adjust the width as needed
                  height: 26,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF83D5B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'View',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0.15,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
