import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../CloudHelper/FirebaseHelper.dart';
import '../Utils/AppController.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0097B2),
        title: Text(
          "Authors",
          style: GoogleFonts.comfortaa(
            fontSize: 23,
            letterSpacing: 1,
            color: CupertinoColors.white,
          ),
        ),
        elevation: 0,
      ),
      body: Center(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Author').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print("Error : ${snapshot.hasError}");
              return const Text("Something  Wrong!");
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color(0xff0097B2),
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      AppController.authorList = snapshot.data!.docs;
                      return Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ListTile(
                          onTap: () {
                            setState(() {
                              AppController.edit = true;
                            });
                            Navigator.pushNamed(context, 'RegisterPage',
                                arguments: index);
                          },
                          title: Text(
                            "${AppController.authorList[index]['authorName']}",
                            style: GoogleFonts.comfortaa(
                                fontSize: 20,
                                color: const Color(0xff0CC0DF),
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "${AppController.authorList[index]['book']}",
                            style: GoogleFonts.comfortaa(
                                fontSize: 15,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                          ),
                          trailing: IconButton(
                            splashRadius: 25,
                            icon: const Icon(
                              Icons.delete_outline,
                              color: Color(0xff0CC0DF),
                            ),
                            onPressed: () {
                              AuthHelper.instance.deleteData(index: index);
                            },
                          ),
                        ),
                      );
                    }),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff0097B2),
        onPressed: () {
          setState(() {
            AppController.edit = false;
          });
          Navigator.of(context).pushReplacementNamed('RegisterPage');
        },
        child: const Icon(
          CupertinoIcons.add,
          size: 30,
          color: CupertinoColors.white,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
