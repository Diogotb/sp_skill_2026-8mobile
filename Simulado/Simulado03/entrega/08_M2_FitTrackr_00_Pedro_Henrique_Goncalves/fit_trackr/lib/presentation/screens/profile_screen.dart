import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../auth/models/user_model.dart';
import '../providers/user_provider.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/custom_header.dart';
import '../widgets/custom_text_form_field.dart';
import '../../models/goal_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _editField({
    required String label,
    required String initialValue,
    required Function(String) onSave,
  }) {
    final controller = TextEditingController(text: initialValue);

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text('Alterar $label'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(labelText: label),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                onSave(controller.text);
                Navigator.pop(context);
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  void _editGoals(UserProvider userProvider) {
    final stepsController =
    TextEditingController(text: userProvider.currentUser!.goals.dailySteps.toString());
    final burnController =
    TextEditingController(text: userProvider.currentUser!.goals.dailyCaloriesBurn.toString());
    final consumeController =
    TextEditingController(text: userProvider.currentUser!.goals.dailyCaloriesConsume.toString());

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Alterar Metas'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextFormField(controller: stepsController, label: "Passos Diários"),
              SizedBox(height: 12,),
              CustomTextFormField(controller: burnController, label: "Calorias Queimadas"),
              SizedBox(height: 12,),
              CustomTextFormField(controller: consumeController, label: "Calorias Consumidas"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),

            TextButton(
              onPressed: () async {
                final newGoals = UserGoals(
                  dailySteps: int.tryParse(stepsController.text) ?? 0,
                  dailyCaloriesBurn: int.tryParse(burnController.text) ?? 0,
                  dailyCaloriesConsume: int.tryParse(consumeController.text) ?? 0,
                );

                await userProvider.updateGoals(newGoals);
                Navigator.pop(context);
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.currentUser;

    if (user == null) {
      return const Scaffold(
        body: Center(child: Text("Nenhum usuário logado")),
      );
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomHeader(label: "Perfil"),
            const SizedBox(height: 24),

            Stack(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(user.avatarUrl),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () => _editField(
                      label: "Avatar URL",
                      initialValue: user.avatarUrl,
                      onSave: (value){
                        userProvider.updateAvatar(value);
                      }
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(6),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            GestureDetector(
              onTap: () => _editField(
                label: "Nome",
                initialValue: user.name,
                onSave: (value) {
                  userProvider.updateName(value);
                },
              ),
              child: ListTile(
                title: const Text("Nome"),
                subtitle: Text(user.name),
                trailing: const Icon(Icons.edit),
              ),
            ),
            GestureDetector(
              onTap: () => _editField(
                label: "Email",
                initialValue: user.email,
                onSave: (value) {
                  userProvider.updateEmail(value);
                },
              ),
              child: ListTile(
                title: const Text("Email"),
                subtitle: Text(user.email),
                trailing: const Icon(Icons.edit),
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text("Metas"),
              subtitle: Text(
                  "Passos: ${user.goals.dailySteps}, Queimadas: ${user.goals.dailyCaloriesBurn}, Consumidas: ${user.goals.dailyCaloriesConsume}"),
              trailing: const Icon(Icons.edit),
              onTap: () => _editGoals(userProvider),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 2),
    );
  }
}
