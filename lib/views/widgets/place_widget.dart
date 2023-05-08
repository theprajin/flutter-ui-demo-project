import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_project/models/place.dart';
import 'package:ui_project/views/detail_page.dart';

class PlaceWidget extends StatelessWidget {
  final List<Place> places;
  const PlaceWidget({
    super.key,
    required this.places,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: places.length,
        itemBuilder: (context, index) {
          Place place = places[index];
          return InkWell(
            onTap: () {
              Get.to(
                DetailPage(place: place),
                transition: Transition.downToUp,
              );
            },
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    right: 10,
                    left: index == 0 ? 10 : 0,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Card(
                      elevation: 2,
                      child: Container(
                        height: 200,
                        width: 200,
                        child: CachedNetworkImage(
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          imageUrl: place.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 25,
                  bottom: 10,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      place.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: place.name.length > 15
                            ? place.name.length > 19
                                ? 13
                                : 17
                            : 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
