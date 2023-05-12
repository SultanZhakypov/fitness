// import 'package:fitness/features/blogger/presentation/widgets/repitition_select_card.dart';
// import 'package:fitness/features/blogger/presentation/widgets/weight_select_card.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../../../internal/helpers/color_helper.dart';
// import '../../../../internal/helpers/text_helper.dart';
// import 'approach_card.dart';

// class ExerciseListWidget extends StatelessWidget {
//   const ExerciseListWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 children: [
//                   Text(
//                     "N подхода",
//                     style: TextHelper.w700s15
//                         .copyWith(color: ColorHelper.greyD1D3D3),
//                   ),
//                   SizedBox(
//                     height: 30.h,
//                   ),
//                   const ApproachCard()
//                 ],
//               ),
//               Column(
//                 children: [
//                   Text(
//                     "Вес",
//                     style: TextHelper.w700s15
//                         .copyWith(color: ColorHelper.greyD1D3D3),
//                   ),
//                   SizedBox(
//                     height: 30.h,
//                   ),
//                   const WeightSelectCard()
//                 ],
//               ),
//               Column(
//                 children: [
//                   Text(
//                     "Повторение",
//                     style: TextHelper.w700s15
//                         .copyWith(color: ColorHelper.greyD1D3D3),
//                   ),
//                   SizedBox(
//                     height: 30.h,
//                   ),
//                   const RepititionSelectCard()
//                 ],
//               ),
//               Container(
//                 height: 40.r,
//                 width: 40.r,
//                 decoration: BoxDecoration(
//                     color: Colors.grey,
//                     borderRadius: BorderRadius.circular(4.r)),
//               )
//             ],
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           // LinearProgressIndicator(
//           //   value: initial,
//           // ),
//           // IconButton(
//           //   onPressed: () {
//           //     update();
//           //   },
//           //   icon: const Icon(
//           //     Icons.mark_as_unread_rounded,
//           //     size: 40,
//           //   ),
//           // )
//         ],
//       );
//   }
// }