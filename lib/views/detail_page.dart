import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ui_project/constants/gap_sizes.dart';
import 'package:ui_project/models/place.dart';

class DetailPage extends StatelessWidget {
  final Place place;

  const DetailPage({
    super.key,
    required this.place,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.name),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            CachedNetworkImage(
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageUrl: place.imageUrl,
            ),
            gapH16,
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Text(
                place.description,
                style: const TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
