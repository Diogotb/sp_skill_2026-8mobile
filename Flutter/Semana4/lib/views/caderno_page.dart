import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_back_button.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/heading_container.dart';

class CadernoPage extends StatefulWidget {
  const CadernoPage({super.key});

  @override
  State<CadernoPage> createState() => _CadernoPageState();
}

class _CadernoPageState extends State<CadernoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomBackButton(),

            SizedBox(height: 24,),

            HeadingContainer(label: "Minhas Anotações",),

            SizedBox(height: 24,),
          ],
        ),
      ),
    );
  }
}
