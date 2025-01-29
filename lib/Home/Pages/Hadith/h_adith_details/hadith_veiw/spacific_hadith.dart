// import 'package:flutter/material.dart';

// class SpacificHadith extends StatefulWidget {
//   int hadithIndex;

//   SpacificHadith({super.key, required this.hadithIndex});

//   @override
//   State<SpacificHadith> createState() => _SpacificHadithState();
// }

// class _SpacificHadithState extends State<SpacificHadith> {
//   double value = 0.0;
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog.adaptive(
//         title: Text("${widget.hadithIndex}"),
//         content: Container(
//           color: Colors.blueGrey,
//           width: double.infinity,
//           height: 300,
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   IconButton(
//                     icon: Icon(
//                       Icons.exposure_neg_1_outlined,
//                       color: Colors.white,
//                     ),
//                     onPressed: () {},
//                   ),
//                   Slider(
//                     value: value,
//                     min: 1,
//                     max: widget.hadithIndex.toDouble(),
//                     divisions: widget.hadithIndex - 1,
//                     activeColor: Colors.blueAccent,
//                     label: value.toInt().toString(),
//                     onChanged: (double newValue) {
//                       setState(() {
//                         value = newValue;
//                       });
//                     },
//                   ),
//                   IconButton(
//                     icon: Icon(
//                       Icons.plus_one_outlined,
//                       color: Colors.white,
//                     ),
//                     onPressed: () {},
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ));
//   }
// }

//============================================================================================================================

// import 'package:flutter/material.dart';

// class SpacificHadith extends StatefulWidget {
//   int hadithIndex;

//   SpacificHadith({super.key, required this.hadithIndex});

//   @override
//   State<SpacificHadith> createState() => _SpacificHadithState();
// }

// class _SpacificHadithState extends State<SpacificHadith> {
//   double value = 1.0;

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog.adaptive(
//       title: Text("الحديث رقم: ${widget.hadithIndex}"),
//       content: Container(
//         color: Colors.blueGrey,
//         width: double.infinity,
//         height: 300,
//         child: StatefulBuilder(
//           builder: (BuildContext context, StateSetter setDialogState) {
//             return Column(
//               children: [
//                 Row(
//                   children: [
//                     IconButton(
//                       icon: Icon(
//                         Icons.exposure_neg_1_outlined,
//                         color: Colors.white,
//                       ),
//                       onPressed: () {
//                         setDialogState(() {
//                           value = (value > 1) ? value - 1 : 1;
//                         });
//                       },
//                     ),
//                     Expanded(
//                       child: Slider(
//                         value: value,
//                         min: 0,
//                         max: widget.hadithIndex.toDouble(),
//                         divisions: widget.hadithIndex - 1,
//                         activeColor: Colors.blueAccent,
//                         label: value.toInt().toString(),
//                         onChanged: (double newValue) {
//                           setDialogState(() {
//                             value = newValue;
//                           });
//                         },
//                       ),
//                     ),
//                     IconButton(
//                       icon: Icon(
//                         Icons.plus_one_outlined,
//                         color: Colors.white,
//                       ),
//                       onPressed: () {
//                         setDialogState(() {
//                           value = (value < widget.hadithIndex)
//                               ? value + 1
//                               : widget.hadithIndex.toDouble();
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20),
//                 Text(
//                   'القيمة الحالية: ${value.toInt()}',
//                   style: TextStyle(color: Colors.white, fontSize: 20),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
//============================================================================================================================

//============================================================================================================================

//============================================================================================================================

//
//============================================================================================================================

//============================================================================================================================

//============================================================================================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/Home/Pages/Hadith/cubit/hadith_cubit.dart';
import 'package:quran_app/Home/Pages/Hadith/h_adith_details/hadith_veiw/hadith_veiw_page.dart';
import 'package:quran_app/Shared/Shared_Components.dart';

class SpacificHadith extends StatefulWidget {
  final int hadithIndex;
  String name;
  bool type;
  SpacificHadith(
      {super.key,
      required this.hadithIndex,
      required this.name,
      required this.type});

  @override
  State<SpacificHadith> createState() => _SpacificHadithState();
}

class _SpacificHadithState extends State<SpacificHadith> {
  double value = 0.0;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HadithCubit>();
    return AlertDialog.adaptive(
      title: Text(
        "عرض الحديث  ${widget.hadithIndex}",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      content: Container(
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade800,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.all(16),
        child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setDialogState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'القيمة الحالية: ${value.toInt()}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.remove_circle_outline,
                        color: Colors.redAccent,
                        size: 30,
                      ),
                      onPressed: () {
                        setDialogState(() {
                          value = (value > 1) ? value - 1 : 1;
                        });
                      },
                    ),
                    Expanded(
                      child: Slider(
                        value: value,
                        min: 0,
                        max: widget.hadithIndex.toDouble(),
                        divisions: widget.hadithIndex - 1,
                        activeColor: Colors.blueAccent,
                        thumbColor: Colors.greenAccent,
                        label: value.toInt().toString(),
                        onChanged: (double newValue) {
                          setDialogState(() {
                            value = newValue;
                          });
                        },
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add_circle_outline,
                        color: Colors.greenAccent,
                        size: 30,
                      ),
                      onPressed: () {
                        setDialogState(() {
                          value = (value < widget.hadithIndex)
                              ? value + 1
                              : widget.hadithIndex.toDouble();
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () async {
                    ShowToast(
                        text: 'تم اختيار القيمة: ${value.toInt()}',
                        state: ToastState.SUCCESS);
                    await cubit.getSpacificHadith(
                        SelectedBook: widget.name,
                        selectedHadith: value.toInt());
                    goto(context, HadithVeiwPage(type: widget.type));
                  },
                  child: Text(
                    'تأكيد القيمة',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

//
//============================================================================================================================

//============================================================================================================================

//============================================================================================================================
