import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:onboarding/colors.dart';
import 'package:onboarding/page_model.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final pages = [
    const PageData(
      title: "Make some\nnoise",
      image: "assets/images/first.json",
      bdColor: AppColors.backgroundLightBlack,
      txtColor: AppColors.textColor,
    ),
    const PageData(
      title: "Let's hunt\nghosts",
      image: "assets/images/second.json",
      bdColor: AppColors.backgroundPista,
      txtColor: Colors.black,
    ),
    const PageData(
      title: "Join the\nGhost Gang.",
      image: "assets/images/gang.json",
      bdColor: Colors.white,
      txtColor: Colors.black,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ConcentricPageView(

        itemBuilder: (index){
          final page = pages[index % pages.length];
          return SafeArea(child: _Page(page: page));
        },
        colors: pages.map((e) => e.bdColor).toList(),
        radius: screenWidth*0.1,
        nextButtonBuilder: (context)=>Padding(
          padding: const EdgeInsets.all(8.0),
          child:Icon(
            Icons.navigate_next,
            size: screenWidth*0.08,
          ),
        ),
      ),
    );
  }
}

class _Page  extends StatelessWidget{
  final PageData page;
  const _Page({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    space(double p)=>SizedBox(height: screenWidth*p/100);
    return Column(
      children: [
        space(45),
        Container(
          decoration: BoxDecoration(
            color: page.bdColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: -5,
                blurRadius: 50,
                offset: const Offset(0, 30),
              ),
            ],
          ),
          height: screenWidth*0.6,
            width: screenWidth*0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(page.image.toString(),),
                  ],
                )),),
        space(10),
        _Text(
          page:page,
          style:TextStyle(
            fontSize:45,
            fontFamily: 'demo',
            color: page.txtColor,
            fontWeight: FontWeight.w600,
            height: 1
          )
        ),
        space(50),
      ],
    );
  }
}

class _Text extends StatelessWidget {
  const _Text({
    Key? key,
    required this.page,
    this.style,
}):super(key : key);

  final PageData page;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('${page.title}',style: style,textAlign: TextAlign.center,),
      ],
    );
  }
}
