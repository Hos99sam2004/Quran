import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/Home/Pages/Hadith/cubit/hadith_cubit.dart';
import 'package:quran_app/Home/Pages/Hadith/h_adith_details/hadith_veiw/hadith_veiw_page.dart';
import 'package:quran_app/Home/Pages/Hadith/h_adith_details/hadith_veiw/spacific_hadith.dart';
import 'package:quran_app/Shared/Shared_Components.dart';

class HAdithDetailsPage extends StatefulWidget {
  String book;

  HAdithDetailsPage({super.key, required this.book});
  @override
  State<HAdithDetailsPage> createState() => _HAdithDetailsPageState();
}

class _HAdithDetailsPageState extends State<HAdithDetailsPage> {
  @override
  double Currantvalue = 1;
  bool isSpacific = false;
  Widget build(BuildContext context) {
    final cubit = context.read<HadithCubit>();
    print(widget.book);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.book}",
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: InkWell(
                onTap: () async {
                  await cubit.getRandomHadith(
                    SelectedBook: widget.book,
                  );
                  goto(context, HadithVeiwPage(type: isSpacific));
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.green,
                  ),
                  child: Center(
                    child: Text(
                      'Generate Random',
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: InkWell(
                onTap: () async {
                  var result = 0;
                  if (widget.book == "bukhari")
                    result = 7563;
                  else if (widget.book == "muslim")
                    result = 3032;
                  else if (widget.book == "ibnmajah")
                    result = 4342;
                  else if (widget.book == "abudawud")
                    result = 3998;
                  else
                    result = 3956;
                  print(result);
                  ShowToast(text: "Select Hadith", state: ToastState.WARNING);

                  goto(
                      context,
                      SpacificHadith(
                          hadithIndex: result,
                          name: widget.book,
                          type: !isSpacific));
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.amber,
                  ),
                  child: Center(
                    child: Text(
                      'Spacific Hadith',
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
