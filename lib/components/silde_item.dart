import 'package:flutter/material.dart';
import 'package:flutter_page_slider_carousel/models/slide.dart';

class SliderItem extends StatelessWidget {
  final int index;
  const SliderItem(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(slideList[index].imageUrl),
                  fit: BoxFit.cover)),
        ),
        Text(
          slideList[index].title,
          style: TextStyle(fontSize: 22, color: Theme.of(context).primaryColor),
        ),
        const SizedBox(
          height: 40,
        ),
        Text(slideList[index].description)
      ],
    );
  }
}
