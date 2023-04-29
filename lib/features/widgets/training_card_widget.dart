import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TrainingCardWidget extends StatelessWidget {
  const TrainingCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 353,
      child: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              height: 120,
              width: 353,
              child: Text("НОГИ"),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 10);
          },
          itemCount: 3),
    );
  }
}
