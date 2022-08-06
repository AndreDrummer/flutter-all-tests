import 'package:alltests/core/constants/strings.dart';
import 'package:alltests/widgets/texts.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(Strings.appTitle),
      ),
      body: Center(
        child: BigText(
          color: Colors.black,
          text: Strings.logged,
        ),
      ),
    );
  }
}
