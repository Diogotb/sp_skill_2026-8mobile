import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fit_trackr/presentation/providers/user_provider.dart';
import 'package:fit_trackr/models/goal_model.dart';
import 'package:fit_trackr/presentation/widgets/custom_button.dart';
import 'package:fit_trackr/presentation/widgets/custom_text_form_field.dart';

class SetGoalsScreen extends StatefulWidget {
  const SetGoalsScreen({super.key});

  @override
  State<SetGoalsScreen> createState() => _SetGoalsScreenState();
}

class _SetGoalsScreenState extends State<SetGoalsScreen> {
  final _stepsController = TextEditingController();
  final _caloriesBurnController = TextEditingController();
  final _caloriesConsumeController = TextEditingController();

  @override
  void dispose() {
    _stepsController.dispose();
    _caloriesBurnController.dispose();
    _caloriesConsumeController.dispose();
    super.dispose();
  }

  void _saveGoals() {
    final steps = int.tryParse(_stepsController.text.trim()) ?? 0;
    final burn = int.tryParse(_caloriesBurnController.text.trim()) ?? 0;
    final consume = int.tryParse(_caloriesConsumeController.text.trim()) ?? 0;

    if (steps <= 0 || burn <= 0 || consume <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Preencha todos os campos com valores válidos")),
      );
      return;
    }

    try {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.updateGoals(UserGoals(
        dailySteps: steps,
        dailyCaloriesBurn: burn,
        dailyCaloriesConsume: consume,
      ));
    } on Exception catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Falha ao atualizar metas. Tente novamente.")),
      );
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Definir Metas")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Rapidinho, antes de começarmos, você precisa definir suas metas!", style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center,),
            const SizedBox(height: 48),
            CustomTextFormField(
              controller: _stepsController,
              label: "Passos Diários",
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 48),
            CustomTextFormField(
              controller: _caloriesBurnController,
              label: "Calorias Queimadas Diárias",
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 48),
            CustomTextFormField(
              controller: _caloriesConsumeController,
              label: "Calorias Consumidas Diárias",
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 48),
            CustomButton(
              label: "Salvar Metas",
              onPressed: _saveGoals,
            ),
          ],
        ),
      ),
    );
  }
}
