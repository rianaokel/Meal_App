import 'package:flutter/material.dart';
import 'package:meal_app/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String id;
  final Color color;

  CategoryItem(
    this.title,
    this.id,
    this.color,
  );

  @override
  Widget build(BuildContext context) {

    void selectCategory(BuildContext ctx) {
      Navigator.of(ctx).pushNamed(
        CategoryMealsScreen.routeName,
      arguments: {
          "id" : id,
        "title" : title,
      }
      );
    }

    return InkWell(

      onTap: () => selectCategory(context),

      child: Container(
        padding: EdgeInsets.all(30.0),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              color,
              Colors.white,
            ],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
    );
  }
}
