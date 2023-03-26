import 'package:flutter/material.dart';

class Slide {
  final String imageUrl;
  final String title;
  final String description;
  Slide(
      {required this.imageUrl, required this.title, required this.description});
}

final slideList = [
  Slide(
      imageUrl: 'assets/images/image1.jpg',
      title: "A about",
      description:
          "This example shows how to use an Expanded widget in a Column so that its middle child, a Container here, expands to fill the space."),
  Slide(
      imageUrl: 'assets/images/image2.jpg',
      title: "B about",
      description: "To create a local project with this code sample, run:"),
  Slide(
      imageUrl: 'assets/images/image3.jpg',
      title: "C about",
      description:
          "Alignment(0.0, 0.0) represents the center of the rectangle. The distance from -1.0 to +1.0 is the distance from one side of the rectangle to the other side of the rectangle. Therefore, 2.0 units horizontally (or vertically) is equivalent to the width (or height) of the rectangle."),
];
