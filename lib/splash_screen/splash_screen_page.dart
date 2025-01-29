import 'package:flutter/material.dart';
import 'package:quran_app/Shared/Shared_Components.dart';
import 'package:quran_app/Home/home_app/home_app_page.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    print(
      "$h and $w",
    );
    return Scaffold(
      // appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            SizedBox(height: h * 0.1),
            Text(
              "Quran App",
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, color: DarkPurple),
            ),
            SizedBox(height: 10),
            Text(
              "Memorize the Quran every day\n   and recite once every day",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: TextColor),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Stack(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        color: DarkPurple,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      width: w * 0.87,
                      height: h * 0.6,
                      child: Stack(
                        // fit: StackFit.expand,
                        children: [
                          Positioned(
                            top: h * 0.09,
                            left: w * 0.1,
                            child: Image.asset(
                              "assets/mosque 1.png",
                            ),
                          ),
                        ],
                      )),
                  Positioned(
                    left: w * 0.1,
                    top: h * 0.55,
                    child: InkWell(
                      onTap: () {
                        goto(context, const HomeAppPage());
                      },
                      child: Container(
                        padding: EdgeInsets.all(11),
                        decoration: BoxDecoration(
                          color: Button,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          "Discover the Quran of Islam",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Container(
            //               child: IconButton(onPressed: () {  }, icon: Icons.abc_outlined, ),
            //             )
            // Positioned(
            //   top: h * 0.3,
            //   // left: w * 0.3,
            //   child: Image(
            //     fit: BoxFit.cover,
            //     image: AssetImage('images/mosque 1.png'),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
