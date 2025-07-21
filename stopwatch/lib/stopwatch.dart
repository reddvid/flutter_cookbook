import 'dart:async';

import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  int seconds = 0;
  late Timer timer;
  bool isTicking = false;

  void _onTick(Timer timer) {
    if (mounted) {
      setState(() {
        ++seconds;
      });
    }
  }

  void _startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), _onTick);

    setState(() {
      isTicking = true;
    });
  }

  void _stopTimer() {
    timer.cancel();

    setState(() {
      isTicking = false;
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String secondsText() => seconds == 1 ? 'second' : 'seconds';

    return Scaffold(
      appBar: AppBar(title: const Text('Stopwatch')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$seconds ${secondsText()}',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.green),
                  foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                ),
                onPressed: isTicking ? null : _startTimer,
                child: const Text('Start'),
              ),
              const SizedBox(width: 20),
              TextButton(
                onPressed: isTicking ? _stopTimer : null,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.red),
                  foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                ),
                child: const Text('Stop'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
