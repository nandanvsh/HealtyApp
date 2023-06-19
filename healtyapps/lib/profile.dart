// import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// ignore: avoid_web_libraries_in_flutter
// import 'dart:html';
// import 'dart:async';
// import 'navbar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // color: Colors.white54,
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 15,
            ),
            ListTile(
              leading: Icon(Icons.arrow_back),
              // title: Text('back'),
              // subtitle: Text('Requirements: N'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Profile",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 26),
                )
              ],
            ),
            imageProfile(),
            const SizedBox(
              height: 20.0,
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView(
              children: [
                Card(
                  margin:
                      const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                  color: Colors.white70,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: const ListTile(
                    title: Text(
                      'Username',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  color: Colors.white70,
                  margin:
                      const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: const ListTile(
                    // leading: Icon(
                    //   Icons.history,
                    //   color: Colors.black54,
                    // ),
                    title: Text(
                      'Nama',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  color: Colors.white70,
                  margin:
                      const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: const ListTile(
                    // leading:
                    //     Icon(Icons.help_outline, color: Colors.black54),
                    title: Text(
                      'Email',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  color: Colors.white70,
                  margin:
                      const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: const ListTile(
                    // leading: Icon(
                    //   Icons.privacy_tip_sharp,
                    //   color: Colors.black54,
                    // ),
                    title: Text(
                      'Alamat',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_outlined),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  color: Colors.white70,
                  margin:
                      const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: const ListTile(
                    // leading: Icon(
                    //   Icons.add_reaction_sharp,
                    //   color: Colors.black54,
                    // ),
                    title: Text(
                      'No Telp',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  color: Colors.white70,
                  margin:
                      const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: const ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: Colors.black54,
                    ),
                    title: Text(
                      'Logout',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_outlined),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
      // bottomNavigationBar: const BottomNavbar(),
    );
  }

  Widget bottomSheet() {
    // ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables
    // var FlatButton;
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(children: <Widget>[
        const Text(
          "Pilih Profile Foto",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton.icon(
              icon: const Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: const Text("Camera"),
            ),
            TextButton.icon(
              icon: const Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: const Text("Galery"),
            ),
          ],
        )
      ]),
    );
  }

  void takePhoto(ImageSource source) async {
    // ignore: deprecated_member_use
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile!;
    });
  }

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 80.0,
          // ignore: unnecessary_null_comparison
          backgroundImage: AssetImage("images/Profile.jpg"),
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context, builder: ((builder) => bottomSheet()));
            },
            child: const Icon(
              Icons.camera_alt,
              color: Colors.teal,
              size: 20.0,
            ),
          ),
        ),
      ]),
    );
  }
}
