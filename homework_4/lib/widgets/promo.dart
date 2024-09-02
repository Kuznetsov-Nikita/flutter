import 'package:flutter/material.dart';

class Promo extends StatelessWidget {
  const Promo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.transparent],
              stops: [0.7, 1.0],
              tileMode: TileMode.clamp,
            ).createShader(bounds);
          },
          child: Image.asset('assets/images/promo.jpg', fit: BoxFit.cover),
        ),
        Container(
          decoration: const BoxDecoration(
            color: Color(0xfff1e2c3), 
            boxShadow: [
              BoxShadow(blurRadius: 20),
            ],
          ), 
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10), 
            child: Text(
              'Добро пожаловать на Ибицу', 
              style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),
            ),
          ),
        ),
      ],
    );
  }
}
