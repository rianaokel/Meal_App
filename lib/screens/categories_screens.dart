import 'package:flutter/material.dart';
import 'package:meal_app/098%20dummy_data.dart';
import 'package:meal_app/models/categories.dart';
import 'package:meal_app/widgets/category_items.dart';

import '../widgets/main_Drawer.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Category Screen"),),
      body: GridView(
          padding: EdgeInsets.all(30),
          children: DUMMY_CATEGORIES
              .map(
                (catData) => CategoryItem(
                  catData.title,
                  catData.id,
                  catData.color
                ),
              )
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20,
          )),
      drawer: MainDrawer(),
    );
  }
}
