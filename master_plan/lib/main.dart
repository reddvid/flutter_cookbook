import 'package:flutter/material.dart';
import 'package:master_plan/models/data_layer.dart';
import 'package:master_plan/models/plan_provider.dart';
import 'package:master_plan/views/plan_creator_screen.dart';
import 'package:master_plan/views/plan_screen.dart';

void main() => runApp(MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PlanProvider(
      notifier: ValueNotifier<List<Plan>>(const []),
      child: MaterialApp(
        title: 'State Management App',
        theme: ThemeData(primarySwatch: Colors.purple),
        home: const PlanCreatorScreen(),
      ),
    );
  }
}
