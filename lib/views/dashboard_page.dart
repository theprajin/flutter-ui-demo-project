import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';
import 'package:ui_project/data/places_list.dart';
import 'package:ui_project/views/widgets/place_widget.dart';
import 'package:ui_project/views/widgets/section_title_widget.dart';

import '../constants/gap_sizes.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Stack(
            children: [
              Container(
                height: 250,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/travel.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Positioned(
                bottom: 20,
                left: 35,
                child: Text(
                  'Welcome to Trip Nepal',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          gapH10,
          const SectionTitleWidget(title: 'Destinations'),
          gapH10,
          PlaceWidget(places: placeList),
          gapH10,
          const SectionTitleWidget(title: 'World Heritage Sites'),
          PlaceWidget(
            places: (placeList
                .where((element) => element.worldHeritage == true)
                .toList()),
          ),
        ],
      ),
    );
  }
}
