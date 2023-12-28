import 'package:flutter/material.dart';

import '../widgets/conformButton.dart';
import '../widgets/dropdown.dart';
import '../widgets/genderIcon.dart';

class UserDetail extends StatefulWidget {
  const UserDetail({super.key});

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 10),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset('assets/img2.png', fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text("Who wants service?"),
                      MyDropdown(
                        options: const ['Item 1', 'Item 2', 'Item 3', 'Item 4'],
                        width: 200.0,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text("Patients age:"),
                              const SizedBox(height: 10),
                              MyDropdown(
                                options: const [
                                  'Item 1',
                                  'Item 2',
                                  'Item 3',
                                  'Item 4'
                                ],
                                width: 100,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text("Gender:"),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Gendericon(
                                      gendericon: "assets/mdi_face-male.png"),
                                  const SizedBox(width: 8),
                                  Gendericon(
                                      gendericon: "assets/mdi_face-female.png"),
                                  const SizedBox(width: 8),
                                  Gendericon(
                                      gendericon: "assets/Ellipse 666.png"),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Text("Location:"),
                      TextField(
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          hintText: 'Address..',
                          hintStyle:
                              TextStyle(color: Colors.red.withOpacity(0.7)),
                          contentPadding: const EdgeInsets.all(16.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: const Icon(
                            Icons.location_on,
                            color: Color.fromARGB(255, 255, 48, 92),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      ConformButton(conformText: "Next")
                    ],
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
