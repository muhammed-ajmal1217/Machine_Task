import 'package:flutter/material.dart';

class ProfilePicPage extends StatelessWidget {
  String profilePic;
  ProfilePicPage({super.key,required this.profilePic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(profilePic))
        ),
      ),
    );
  }
}