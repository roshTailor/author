import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../CloudHelper/FirebaseHelper.dart';
import '../Model/AuthorModel.dart';
import '../Utils/AppController.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppController.authorController.clear();
    AppController.bookController.clear();
    AppController.descController.clear();
  }

  @override
  Widget build(BuildContext context) {
    int? index = ModalRoute.of(context)!.settings.arguments as int?;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (AppController.edit == true) {
        AppController.descController.text =
            AppController.authorList[index!]['description'];
        AppController.authorController.text =
            AppController.authorList[index]['name'];
        AppController.bookController.text =
            AppController.authorList[index]['book'];
      }
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0xff0097B2),
        actions: [
          IconButton(
              onPressed: () {
                if (AppController.edit == true) {
                  AuthHelper.instance.updateData(
                      index: index!,
                      authorData: Author(
                          book: AppController.bookController.text,
                          authorName: AppController.authorController.text,
                          description: AppController.descController.text));
                } else {
                  AuthHelper.instance.insertData(Author(
                      book: AppController.bookController.text,
                      authorName: AppController.authorController.text,
                      description: AppController.descController.text));
                }

                // var authors = Author(
                //     book: AppController.bookController.text,
                //     name: AppController.authorController.text,
                //     description: AppController.descController.text);
                // AuthHelper.instance.insertData(authors);
                // AppController.authorController.clear();
                // AppController.bookController.clear();
                // AppController.descController.clear();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("HomePage", (route) => false);
              },
              icon: const Icon(Icons.done))
        ],
        title: Text(
          "Register",
          style: GoogleFonts.comfortaa(
            fontSize: 22,
            letterSpacing: 1,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: AppController.authorController,
                  style: GoogleFonts.comfortaa(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    labelText: "Author Name",
                    floatingLabelStyle: const TextStyle(
                      color: Color(0xff0097B2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xff0097B2), width: 1.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: AppController.bookController,
                  style: GoogleFonts.comfortaa(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    labelText: "Book Name",
                    floatingLabelStyle: const TextStyle(
                      color: Color(0xff0097B2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xff0097B2), width: 1.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: AppController.descController,
                  style: GoogleFonts.comfortaa(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  maxLines: 20,
                  decoration: InputDecoration(
                    labelText: "Description",
                    alignLabelWithHint: true,
                    floatingLabelStyle: const TextStyle(
                      color: Color(0xff0097B2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xff0097B2), width: 1.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
