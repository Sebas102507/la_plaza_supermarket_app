import 'package:flutter/material.dart';

class LoadingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.all(Radius.circular(5)),
          image: DecorationImage(
              image: AssetImage("assets/IconoCargando.png")
          )
      ),
    );
  }
}
