import 'package:flutter/material.dart';
import 'package:my_notes/controllers/category_controller.dart';
import 'package:my_notes/models/category_model.dart';
import 'package:my_notes/themes/app_colors.dart';
import 'package:my_notes/views/category_details_page.dart';
import 'package:my_notes/widgets/custom_app_bar.dart';
import 'package:my_notes/widgets/custom_back_button.dart';
import 'package:my_notes/widgets/custom_container.dart';
import 'package:my_notes/widgets/custom_drawer.dart';
import 'package:my_notes/widgets/heading_container.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();

}

class _CategoriesPageState extends State<CategoriesPage> {
  final CategoryController _categoryController = CategoryController();

  List<Category> _categories = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    setState(() {
      _isLoading = true;
    });
    try{
      _categories = await _categoryController.fetchCategories();
      print("categorias: $_categories");
    } catch (e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Ocorreu um erro inesperado")));
    } finally{
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomBackButton(),

                SizedBox(height: 24,),

                HeadingContainer(label: "Categorias",),

                SizedBox(height: 24,),

                CustomContainer(
                  height: 486,
                  width: 373,
                  child:
                  _isLoading ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemCount: _categories.length,
                    itemBuilder: (context, index) {
                      final category = _categories[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical:8.0, horizontal: 4),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 5,
                          borderRadius: BorderRadius.circular(20),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryDetailsPage(category: category),));
                            },
                            child: Container(
                              alignment:Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(category.color),      
                                borderRadius: BorderRadius.circular(20)
                              ),
                              width: 367,
                              height: 76,
                              child: Text(category.name, style: Theme.of(context).textTheme.headlineLarge,),
                            ),
                          ),
                        ),
                      );
                  },),
                ),
                SizedBox(height: 12,),
                Column(
                  children: [
                    Text("Você pode tocar em uma categoria para ver mais",),
                    SizedBox(height: 24,),
                    SizedBox(height: 60, width: 370, child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/category/add');
                      },
                      child: Text("Adicionar", style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white
                      ),),
                    ),),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
