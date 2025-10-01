import 'package:fit_trackr/presentation/providers/user_provider.dart';
import 'package:fit_trackr/core/enums/activity_type_enum.dart';
import 'package:fit_trackr/models/activity_model.dart';
import 'package:fit_trackr/presentation/providers/activities_provider.dart';
import 'package:fit_trackr/presentation/screens/activity_history_screen.dart';
import 'package:fit_trackr/presentation/widgets/activity_selector.dart';
import 'package:fit_trackr/presentation/widgets/bottom_navigation_bar.dart';
import 'package:fit_trackr/presentation/widgets/custom_button.dart';
import 'package:fit_trackr/presentation/widgets/custom_header.dart';
import 'package:fit_trackr/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddActivityScreen extends StatefulWidget {
  const AddActivityScreen({super.key});

  @override
  State<AddActivityScreen> createState() => _AddActivityScreenState();
}

class _AddActivityScreenState extends State<AddActivityScreen> {

  final _durationController = TextEditingController();
  final _caloriesController = TextEditingController();
  final _distanceController = TextEditingController();
  ActivityType? _selectedActivityType;

  @override
  Widget build(BuildContext context) {
    final _activityProvider = Provider.of<ActivitiesProvider>(context);
    final user = Provider.of<UserProvider>(context).currentUser;

    return Scaffold(
      body: Padding(padding: EdgeInsets.all(16), child: Column(
        children: [
          CustomHeader(label: "Adicionar"),

          SizedBox(height: 48,),
          ActivitySelector(
            initialActivity: ActivityType.natacao,
            onActivityChanged: (value) {
            setState(() {
              _selectedActivityType = value;
            });
          },),
          SizedBox(height: 48,),
          CustomTextFormField(controller: _durationController, label: "Duração"),
          SizedBox(height: 48,),
          CustomTextFormField(controller: _caloriesController, label: "Calorias Queimadas"),
          SizedBox(height: 48,),
          _selectedActivityType == ActivityType.ciclismo || _selectedActivityType == ActivityType.corrida ?
          CustomTextFormField(controller: _distanceController, label: "Distância")
          :
              Container(),
          SizedBox(height: 84,),
          CustomButton(
            onPressed: () {
              final user = Provider.of<UserProvider>(context, listen: false).currentUser;
              final activityProvider = Provider.of<ActivitiesProvider>(context, listen: false);

              if (_selectedActivityType == null ||
                  _durationController.text.isEmpty ||
                  _caloriesController.text.isEmpty ||
                  ((_selectedActivityType == ActivityType.ciclismo ||
                      _selectedActivityType == ActivityType.corrida) &&
                      _distanceController.text.isEmpty)) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Preencha todos os campos corretamente")),
                );
                return;
              }

              final duration = _durationController.text.trim();
              final calories = int.tryParse(_caloriesController.text) ?? 0;
              final distance = (_selectedActivityType == ActivityType.ciclismo ||
                  _selectedActivityType == ActivityType.corrida)
                  ? double.tryParse(_distanceController.text) ?? 0
                  : 0;

              final activity = Activity(
                userId: user?.id ?? "",
                type: _selectedActivityType!,
                duration: duration,
                distance: distance.toDouble(),
                caloriesBurned: calories,
                createdAt: DateTime.now(),
              );

              activityProvider.addActivity(activity);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => ActivityHistoryScreen()),
              );
            },
            label: "Salvar",
          ),
        ],
      ),),

      bottomNavigationBar: CustomBottomNavBar(currentIndex: 1),
    );
  }
}
