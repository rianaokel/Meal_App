import 'package:flutter/material.dart';
import 'package:meal_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {

  Widget buildListTile(String text, IconData icon, VoidCallback tapHandler){

      return ListTile(
        leading: Icon(icon, color: Colors.indigo,),
        title: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.indigo,
          ),
        ),
        onTap: tapHandler,
      );


  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            child: DrawerHeader(

              child: Text("Drawer", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 40),),
            ),
          ),
          buildListTile("Meals", Icons.set_meal,(){Navigator.of(context).pushReplacementNamed("/");}),
          buildListTile("Filters", Icons.category,(){Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);}),
          buildListTile("Stuff", Icons.style_rounded,(){Navigator.of(context).pushNamed("");}),

        ],
      ),
    );
  }
}
