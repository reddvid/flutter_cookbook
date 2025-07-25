import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stopwatch/platform_alert.dart';

class StopWatch extends StatefulWidget {
  final String name;
  final String email;
  const StopWatch({super.key, required this.name, required this.email});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  int milliseconds = 0;
  late Timer timer;
  bool isTicking = false;
  final laps = <int>[];
  final itemHeight = 60.0;
  final scrollController = ScrollController();

  void _onTick(Timer timer) {
    if (mounted) {
      setState(() {
        milliseconds += 100;
      });
    }
  }

  void _lap() {
    setState(() {
      laps.add(milliseconds);
      milliseconds = 0;
    });

    scrollController.animateTo(
      itemHeight * laps.length,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  void _startTimer() {
    timer = Timer.periodic(Duration(milliseconds: 100), _onTick);

    setState(() {
      isTicking = true;
      laps.clear();
    });
  }

  void _stopTimer(BuildContext context) {
    timer.cancel();

    setState(() {
      isTicking = false;
    });

    // Show alert dialog for total elapsed time
    // final totalRuntime = laps.fold(milliseconds, (total, lap) => total + lap);
    // final alert = PlatformAlert(
    //   title: 'Run Completed!',
    //   message: 'Total Run Time is ${_secondsText(totalRuntime)}.',
    // );
    // alert.show(context);

    // Show bottom sheet for total runtime
    final controller = showBottomSheet(
      context: context,
      builder: _buildRunCompletedSheet,
    );
    Future.delayed(const Duration(seconds: 5)).then((_) {
      controller.close();
    });
  }

  Widget _buildRunCompletedSheet(BuildContext context) {
    final totalRuntime = laps.fold(milliseconds, (total, lap) => total + lap);
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Container(
        color: Theme.of(context).cardColor,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Run Finished!', style: textTheme.headlineSmall),
              Text('Total Run Time is ${_secondsText(totalRuntime)}'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLapDisplay() {
    return Scrollbar(
      child: ListView.builder(
        controller: scrollController,
        itemExtent: itemHeight,
        itemCount: laps.length,
        itemBuilder: (context, index) {
          final milliseconds = laps[index];

          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 50),
            title: Text('Lap ${index + 1}'),
            trailing: Text(_secondsText(milliseconds)),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    scrollController.dispose();
    super.dispose();
  }

  String _secondsText(int milliseconds) {
    final seconds = milliseconds / 1000;
    return '$seconds seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name)),
      body: Column(
        children: [
          Expanded(child: _buildCounter(context)),
          Expanded(child: _buildLapDisplay()),
        ],
      ),
    );
  }

  Widget _buildCounter(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Lap ${laps.length + 1}',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.copyWith(color: Colors.white),
          ),
          Text(
            _secondsText(milliseconds),
            style: Theme.of(
              context,
            ).textTheme.headlineLarge!.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 20),
          _buildControls(),
        ],
      ),
    );
  }

  Widget _buildControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(
              isTicking ? Colors.grey : Colors.green,
            ),
            foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
          ),
          onPressed: isTicking ? null : _startTimer,
          child: const Text('Start'),
        ),
        const SizedBox(width: 20),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(
              isTicking ? Colors.yellow : Colors.grey,
            ),
          ),
          onPressed: isTicking ? _lap : null,
          child: const Text('Lap'),
        ),
        const SizedBox(width: 20),
        Builder(
          builder: (context) => TextButton(
            onPressed: isTicking ? () => _stopTimer(context) : null,
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(
                isTicking ? Colors.red : Colors.grey,
              ),
              foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
            ),
            child: const Text('Stop'),
          ),
        ),
      ],
    );
  }
}
