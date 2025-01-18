import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news2/droo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const difultFontFamily = 'Avenir';
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    const primearyTextColor = Color(0xff0d253c);
    const secondryTextColor = Color(0xff2d4379);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: const TextTheme(
            bodyMedium: TextStyle(
                color: primearyTextColor,
                fontSize: 14,
                fontFamily: difultFontFamily),
            labelMedium: TextStyle(
              fontFamily: difultFontFamily,
              fontSize: 15,
              color: secondryTextColor,
            ),
            headlineLarge: TextStyle(
              fontFamily: difultFontFamily,
              fontWeight: FontWeight.bold,
              color: primearyTextColor,
            )),
      ),
      // home: Stack(
      //   children: [
      //     const Positioned.fill(child: HomeScreen()),
      //     Positioned(
      //       bottom: 0,
      //       left: 0,
      //       right: 0,
      //       child: _BottomNavigation(),
      //     )
      //   ],
      // ),
      // home: const Splashscreen(),
      home: const DropdownButtonApp(),
    );
  }
}
// mohgamma
// mohammad 2
class _BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 85,
      child: Stack(
        children: [
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 65,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButomNaviageionIthem(
                      iconFileName: 'Home.png',
                      activeIconeFileName: 'Home.png',
                      title: "Home",
                    ),
                    ButomNaviageionIthem(
                      iconFileName: 'Articles.png',
                      activeIconeFileName: 'Articles.png',
                      title: "Home",
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ButomNaviageionIthem(
                      iconFileName: 'Search.png',
                      activeIconeFileName: 'Search.png',
                      title: "Home",
                    ),
                    ButomNaviageionIthem(
                      iconFileName: 'Menu.png',
                      activeIconeFileName: 'Menu.png',
                      title: "Home",
                    )
                  ],
                ),
              )),
          Center(
              child: Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(50),
                boxShadow: const [
                  BoxShadow(blurRadius: 10, color: Color(0xdd9b8487))
                ],
                border: Border.all(color: Colors.white, width: 4)),
            child: const Icon(
              CupertinoIcons.plus,
              color: Colors.white,
            ),
          )),
        ],
      ),
    );
  }
}

class ButomNaviageionIthem extends StatelessWidget {
  final String iconFileName;
  final String activeIconeFileName;
  final String title;

  const ButomNaviageionIthem(
      {super.key,
      required this.iconFileName,
      required this.activeIconeFileName,
      required this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/img/icons/$iconFileName"),
        const SizedBox(
          height: 4,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 8, color: Colors.blueGrey),
        )
      ],
    );
  }
}
