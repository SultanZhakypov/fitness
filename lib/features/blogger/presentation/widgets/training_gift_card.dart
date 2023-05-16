import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TrainingGiftCard extends StatelessWidget {
  const TrainingGiftCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      "assets/images/lottie_777.json",
      fit: BoxFit.cover,
    );
  }
}
