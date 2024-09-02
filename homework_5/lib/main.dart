import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:homework_5/color_filters.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _colorFilters = const [
    ColorFilters.identity,
    ColorFilters.invert,
    ColorFilters.sepia,
    ColorFilters.greyscale,
  ];

  int _colorFilterIndex = 0;
  Color _textColor = Colors.red;
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
  }

  void _setColorFilterIndex(int newColorFilterIndex) {
    setState(() {
      _colorFilterIndex = newColorFilterIndex;
    });
  }

  void _setTextColor(Color newColor) {
    setState(() {
      _textColor = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16), 
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  InteractiveViewer(
                    minScale: 0.25,
                    maxScale: 5,
                    child: ColorFiltered(
                      colorFilter: _colorFilters[_colorFilterIndex].filter, 
                      child: Image.asset(
                        'assets/images/image.jpg', 
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Text(
                    _textController.text, 
                    style: TextStyle(color: _textColor, fontSize: 24),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _colorFilters.length,
                  itemBuilder: (context, index) {
                    final colorFilter = _colorFilters[index];
                    return InkWell(
                      onTap: () => _setColorFilterIndex(index),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(color: Theme.of(context).primaryColorDark, width: 2),
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                        ),
                        position: DecorationPosition.foreground,
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            ColorFiltered(
                              colorFilter: colorFilter.filter, 
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(10)), 
                                child: Image.asset(
                                  'assets/images/preview_image.jpg',
                                ),
                              ),
                            ),
                            if (index == _colorFilterIndex)
                              Text(
                                colorFilter.name, 
                                style: const TextStyle(color: Colors.white, fontSize: 16),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(width: 24),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      keyboardType: TextInputType.text,
                      onChanged: (_) => setState(() {}),
                    ),
                  ),
                  IconButton(
                    onPressed: () async =>
                      _setTextColor(await showColorPickerDialog(context, _textColor)),
                    icon: Icon(
                      Icons.brush,
                      color: _textColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
