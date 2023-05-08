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
    return ListView(
      children: [
        CachedNetworkImage(
            height: 200,
            placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            imageUrl:
                'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png'),
        gapH20,
        rowWithContainer(keyField: 'Name: ', valueField: 'Prajin Bajracharya'),
        gapH12,
        rowWithContainer(
            keyField: 'Address: ', valueField: 'Chyasal, Lalitpur, Nepal'),
        gapH12,
        rowWithContainer(keyField: 'Gender: ', valueField: 'Male'),
      ],
    );
  }

  Container rowWithContainer(
      {required String keyField, required String valueField}) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Row(
        children: [
          text(txt: keyField),
          gapW20,
          text(txt: valueField),
        ],
      ),
    );
  }

  Text text({required String txt}) {
    return Text(
      txt,
      style: const TextStyle(fontSize: 20),
    );
  }
}
