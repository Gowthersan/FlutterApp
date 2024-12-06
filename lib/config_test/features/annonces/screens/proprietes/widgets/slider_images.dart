import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mombien_test/config_test/features/annonces/models/proprietes.dart';
import 'package:mombien_test/config_test/utils/constants/colors.dart';

class CarouselwithIndicatorDemo extends StatefulWidget {
  final TPropertiesModel propertiesModel;
  const CarouselwithIndicatorDemo({super.key, required this.propertiesModel});

  @override
  State<CarouselwithIndicatorDemo> createState() =>
      _CarouselwithIndicatorDemoState();
}

class _CarouselwithIndicatorDemoState extends State<CarouselwithIndicatorDemo> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _controller,
          items: widget.propertiesModel.images
              .map((item) => Image.asset(
                    item,
                    fit: BoxFit.cover,
                    width: 1000,
                  ))
              .toList(),
          options: CarouselOptions(
            viewportFraction: 1,
            height: MediaQuery.of(context).size.height / 1.7,
            autoPlay: false,
            enlargeCenterPage: false,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.propertiesModel.images.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
                width: 12,
                height: _current == entry.key ? 6 : 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? TColors.white
                          : TColors.black)
                      .withOpacity(
                    _current == entry.key ? 0.5 : 0.2,
                  ),
                ),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
