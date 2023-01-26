import 'package:flutter/material.dart';
import '../098 dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeNam = 'meal_Detail';

  Widget callIngredientText(BuildContext ctx, String Txt) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Text(
        Txt,
        style: Theme
            .of(ctx)
            .textTheme
            .titleLarge,
      ),
    );
  }

  Widget returnContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFA4331B)),
        color: Color.fromRGBO(1, 228, 1, 1),
      ),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal_Id = ModalRoute
        .of(context)
        ?.settings
        .arguments as String;
    final selectMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == meal_Id);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(selectMeal.imageUrl),
            ),
            callIngredientText(context, "Ingredients"),
            returnContainer(
              ListView.builder(
                itemBuilder: (ctx, index) =>
                    Card(
                      color: Theme
                          .of(context)
                          .accentColor,
                      child: Container(
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Text(selectMeal.ingredients[index]),
                        ),
                      ),
                    ),
                itemCount: selectMeal.ingredients.length,
              ),
            ),
            callIngredientText(context, "Steps"),
            returnContainer(
              ListView.builder(
                itemBuilder: (ctx, index) =>
                    Column(children: [ListTile(
                      leading: CircleAvatar(backgroundColor: Colors.white,
                        child: Text("${index + 1}"),),
                      title: Text(selectMeal.steps[index]),
                    ),
                      Divider(),
                    ],
                    ),
                itemCount: selectMeal.steps.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){Navigator.of(context).pop(meal_Id);},
        child: Icon(Icons.delete),
      ),
    );
  }
}
