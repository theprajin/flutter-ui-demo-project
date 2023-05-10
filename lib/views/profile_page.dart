import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ui_project/constants/gap_sizes.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(
                height: 200,
                placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                imageUrl:
                    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png'),
            profileRowItem(title: 'Prajin Bajracharya', icon: Icons.person),
            lineDivider(),
            profileRowItem(
                title: 'Chyasal, Lalitpur', icon: Icons.map_outlined),
            lineDivider(),
            profileRowItem(title: 'Birthday', icon: Icons.calendar_today),
            lineDivider(),
            profileRowItem(title: 'Phone number', icon: Icons.phone_android),
            lineDivider(),
            profileRowItem(
                title: 'email@email.com', icon: Icons.email_outlined),
            lineDivider(),
            profileRowItem(title: 'Password', icon: Icons.password),
            lineDivider(),
            gapH20,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                maximumSize: const Size(300, 40),
              ),
              onPressed: () {},
              child: const Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }

  Divider lineDivider() {
    return const Divider(
      height: 1,
      color: Colors.black,
    );
  }

  Row profileRowItem({required String title, required IconData icon}) {
    return Row(
      children: [
        Container(
          height: 70,
          margin: const EdgeInsets.fromLTRB(25, 10, 50, 0),
          child: Icon(icon),
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
