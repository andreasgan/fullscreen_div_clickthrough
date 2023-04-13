import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:html';

void main() {
  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(
      'box',
      (int viewId) => DivElement()
        ..style.width = '100px'
        ..style.height = '100px'
        ..style.background = 'red'
        ..onClick.listen((event) {
          (event.target as DivElement).requestFullscreen();
        }));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 100,
              width: 100,
              child: HtmlElementView(viewType: 'box'),
            ),
            Expanded(
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => debugPrint('Clicked'),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.amber,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
