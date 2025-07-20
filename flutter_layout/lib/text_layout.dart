import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextLayout extends StatelessWidget {
  const TextLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Hello, World!', style: GoogleFonts.leckerliOne(fontSize: 40)),
        Text(
          'Text can wrap without issue',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const Text(
          'This is a long text that will wrap to the next line if it exceeds the width of the screen. '
          'Flutter handles text layout efficiently, ensuring that your text is displayed correctly.',
          style: TextStyle(fontSize: 14),
        ),
        const Divider(),
        RichText(
          text: const TextSpan(
            text: 'Flutter text is ',
            style: TextStyle(fontSize: 22, color: Colors.black),
            children: [
              TextSpan(
                text: 'really ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
                children: [
                  TextSpan(
                    text: 'powerful.',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.double,
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
