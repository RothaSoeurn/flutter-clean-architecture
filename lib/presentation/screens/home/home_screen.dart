import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // String _result = "Waiting...";
  late CarouselController _controller;
  late PageController _pageController;
  int _currentIndex = 0;
  int _lastReportedPage = 0;
  final List<String> _images = [
    'https://cdn.pixabay.com/photo/2022/02/01/02/47/smartphone-6985369_1280.png',
    'https://cdn.martech.zone/wp-content/uploads/2019/01/ios-android-mobile-app-banner.png',
    'https://twinr.dev/wp-content/uploads/2024/06/1.-Featured-Image-1024x536.webp',
  ];
  @override
  void initState() {
    super.initState();

    // _startIsolate();
    _controller = CarouselController(initialItem: _currentIndex);
    _pageController = PageController(initialPage: _currentIndex);

    Timer.periodic(Duration(seconds: 10), (timer) {
      if (_currentIndex < _images.length - 1) {
        setState(() {
          _currentIndex++;
        });
      } else {
        setState(() {
          _currentIndex = 0;
        });
      }
      double offset = _currentIndex * MediaQuery.of(context).size.width;
      _controller.animateTo(
        offset,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      _pageController.animateToPage(
        _currentIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Text(_result, style: const TextStyle(fontSize: 18)),
          // const SizedBox(height: 20),
          // ElevatedButton(
          //   onPressed: _startIsolate,
          //   child: const Text('Start Isolate'),
          // ),
          NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.depth == 0 &&
                  notification is ScrollUpdateNotification) {
                final ScrollMetrics metrics = notification.metrics;
                final double currentPage =
                    metrics.pixels / metrics.viewportDimension;
                final int roundedPage = currentPage.round();
                // If you want to update the page index:
                if (roundedPage != _lastReportedPage) {
                  setState(() {
                    _lastReportedPage = roundedPage;
                    _currentIndex = roundedPage;
                  });
                }
              }
              return true;
            },
            child: SizedBox(
              height: 300,
              child: CarouselView.weighted(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                controller: _controller,
                // scrollDirection: Axis.vertical,

                padding: EdgeInsets.all(10),
                itemSnapping: true,
                flexWeights: [3],
                onTap: (value) {
                  setState(() {
                    _currentIndex = value;
                  });
                },
                children:
                    List.generate(growable: true, _images.length, (index) {
                  return Image.network(_images[index], fit: BoxFit.cover);
                }),
              ),
            ),
          ),
          AnimatedSmoothIndicator(
            activeIndex: _currentIndex,
            // controller: _pageController, // PageController
            count: _images.length,
            effect: ExpandingDotsEffect(), // your preferred effect
            onDotClicked: (index) {
              setState(() {
                _currentIndex = index;
              });
              _controller.animateTo(
                index * MediaQuery.of(context).size.width,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              // _pageController.animateToPage(index, duration: Duration(milliseconds: 300));
            },
          )
        ],
      ),
    );
  }
}
