import 'package:flutter/material.dart';

import '../widgets/main_Drawer.dart';

class FiltersScreen extends StatelessWidget {
 static const routeName='/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Filters"),),
      body: null,
      drawer: MainDrawer(),
    );
  }
}
