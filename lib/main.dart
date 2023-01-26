import 'package:flutter/material.dart';
import 'package:meal_app/rate_App.dart';
import 'package:meal_app/screens/category_meals_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import 'package:meal_app/widgets/main_Drawer.dart';
import 'package:rate_my_app/rate_my_app.dart';
import '/screens/categories_screens.dart';
import 'screens/filters_screen.dart';

void main()=>
  runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.grey,
        canvasColor: Color.fromRGBO(1, 228, 1, 1),
        textTheme: ThemeData.light().textTheme.copyWith(

          bodyLarge: TextStyle(
            color: Color.fromRGBO(255, 245, 45, 1),
          ),
          bodySmall: TextStyle(
            color: Color.fromRGBO(255, 245, 45, 1),
          ),
          titleMedium : TextStyle(
            fontSize: 15,
          fontFamily: "Raleway-Bold",
            fontWeight: FontWeight.bold,
          ),
        )
      ),
      //home:  MyHomePage(),
      //home: CategoriesScreen(),

      routes : {
        '/' : (context) => tabsScreen(),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
        MealDetailScreen.routeNam: (context) => MealDetailScreen(),
        FiltersScreen.routeName: (context) => FiltersScreen(),



      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});


  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {

  final AppRating appRating = AppRating();

  @override
  void initState() {

    super.initState();
    
    appRating.rateApp(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipe App"),
      ),
      body: Container(

          child: null,

      ),
    );
  }
}
