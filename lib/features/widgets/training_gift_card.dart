import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TrainingGiftCard extends StatefulWidget {
  const TrainingGiftCard({
    super.key,
  });

  @override
  State<TrainingGiftCard> createState() => _TrainingGiftCardState();
}

class _TrainingGiftCardState extends State<TrainingGiftCard> {
  @override
  Widget build(BuildContext context) {
    return Lottie.network(
        "https://assets6.lottiefiles.com/packages/lf20_Y53BlMV4Q3.json");
  }
}
