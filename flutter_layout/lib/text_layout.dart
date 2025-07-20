import 'package:flutter/material.dart';

class TextLayout extends StatelessWidget {
  const TextLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Hello, World!', style: TextStyle(fontSize: 16)),
        Text(
          'Text can wrap without issue',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const Text(
          'This is a long text that will wrap to the next line if it exceeds the width of the screen. '
          'Flutter handles text layout efficiently, ensuring that your text is displayed correctly.',
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
