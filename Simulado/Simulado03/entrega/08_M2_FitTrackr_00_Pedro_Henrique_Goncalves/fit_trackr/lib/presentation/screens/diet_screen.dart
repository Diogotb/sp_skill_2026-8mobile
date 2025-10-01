import 'package:fit_trackr/presentation/providers/meals_provider.dart';
import 'package:fit_trackr/presentation/screens/add_meal_screen.dart';
import 'package:fit_trackr/presentation/widgets/bottom_navigation_bar.dart';
import 'package:fit_trackr/presentation/widgets/meal_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_header.dart';

class DietScreen extends StatefulWidget {
  const DietScreen({super.key});

  @override
  State<DietScreen> createState() => _DietScreenState();
}

class _DietScreenState extends State<DietScreen> {

  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<MealsProvider>(context, listen: false).fetchMeals()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            CustomHeader(label: "Refeições"),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Expanded(child: MealListView()),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 2),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddMealScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
