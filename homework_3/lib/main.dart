import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:homework_3/extensions.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Homework 3',
      theme: ThemeData(fontFamily: 'KdamThmor'),
      home: const MainPage(title: String.fromEnvironment('MAIN_PAGE_TITLE')),
    );
  }
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({super.key, required this.title});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late InfiniteScrollController _controller;

  @override
  void initState() {
    _controller = InfiniteScrollController(initialItem: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final images = [
      'assets/images/1.jpg',
      'assets/images/2.jpg',
      'assets/images/3.jpg',
      'assets/images/4.jpg',
      'assets/images/5.jpg',
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24), 
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title, 
                style: TextStyle(
                  fontSize: 32,
                  color: HexColor.fromHex(const String.fromEnvironment('THEME_COLOR')),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'This Flutter application will contain carousel with different cool images. Flutter forever!',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 300,
                child: InfiniteCarousel.builder(
                  controller: _controller,
                  itemCount: images.length, 
                  itemExtent: 120,
                  scrollBehavior: ScrollConfiguration.of(context).copyWith(
                    dragDevices: {
                      PointerDeviceKind.touch,
                      PointerDeviceKind.mouse
                    },
                  ),
                  itemBuilder: (context, itemIndex, realIndex) {
                    final currentOffset = 120 * realIndex;
                    return AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        final diff = _controller.offset - currentOffset;
                        const maxPadding = 10.0;
                        const carouselRatio = 120 / maxPadding;

                        return Padding(
                          padding: EdgeInsets.only(
                            top: (diff / carouselRatio).abs(),
                            bottom: (diff / carouselRatio).abs(),
                          ),
                          child: child,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: GestureDetector(
                          onTap: () => _controller.animateToItem(realIndex), 
                          child: Image.asset(images[itemIndex]),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
