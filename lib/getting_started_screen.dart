import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_page_slider_carousel/components/TextButtonCustom.dart';
import 'package:flutter_page_slider_carousel/components/silde_item.dart';
import 'package:flutter_page_slider_carousel/components/slide_dots.dart';
import 'package:flutter_page_slider_carousel/models/slide.dart';

class GettingStartedScreen extends StatefulWidget {
  const GettingStartedScreen({super.key});

  @override
  State<GettingStartedScreen> createState() => _GettingStartedScreenState();
}

class _GettingStartedScreenState extends State<GettingStartedScreen> {
  int _currentPage = 0;

  final PageController _pageController =
      PageController(initialPage: 0); //เปลี่ยน page

  //ถ้า เริ่มสร้าง activity
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(_currentPage,
          duration: Duration(microseconds: 300), curve: Curves.easeIn);
    });
  }

  //ถ้า activity ถูก กำลาย
  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    PageView.builder(
                      scrollDirection: Axis.horizontal, //scroll ด้าน ซ้ำ
                      onPageChanged:
                          _onPageChanged, // set ว่า เลื่อน อยู่ page ไหนแล้ว
                      controller: _pageController,
                      itemBuilder: (ctx, index) => SliderItem(index),
                      itemCount: slideList.length,
                    ),
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 35),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (int i = 0; i < slideList.length; i++)
                                if (i == _currentPage)
                                  SlideDots(true)
                                else
                                  SlideDots(false)
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Text(_currentPage.toString()),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  textButtonCustomStyle("Getting Started", () {},
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(color: Colors.blue),
                        ),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Have an account?",
                        style: TextStyle(fontSize: 18),
                      ),
                      textButtonCustomStyle("Login", () {}),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
