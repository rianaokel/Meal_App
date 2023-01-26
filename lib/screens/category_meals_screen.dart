import 'package:flutter/material.dart';
import 'package:meal_app/098 dummy_data.dart';
import 'package:meal_app/widgets/meal_items.dart';
import 'package:meal_app/models/meals.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "category_meals";

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  late String categoryTitle;
  late List<Meal> displayedMeals;

@override
  void didChangeDependencies() {
  final routeArg =
  ModalRoute.of(context)?.settings.arguments as Map<String, String>;
  final categoryId = routeArg["id"];
  categoryTitle = routeArg["title"]!;
  displayedMeals = DUMMY_MEALS.where((meal) {
    return meal.categories.contains(categoryId);
  }).toList();
    super.didChangeDependencies();
  }



  void _removeMeal(String mealId){

    setState(() {
      displayedMeals.removeWhere((meal) => meal.id==mealId);
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("$categoryTitle"),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItems(
            id: displayedMeals[index].id,
            imageUrl: displayedMeals[index].imageUrl,
            title: displayedMeals[index].title,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
