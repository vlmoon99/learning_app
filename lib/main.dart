import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  return runApp(ModularApp(module: AppModule(), child: AppWidget()));
}

//Root widget
class AppWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    //MaterialApp - це віджет який дає встроєну моливість навігації , також дає відчуття нативної
    //платформи
    return MaterialApp.router(
      title: 'My Smart App',
      theme: ThemeData(primarySwatch: Colors.blue),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}

//Root module
class AppModule extends Module {
  //Залежності (Dependecy)
  @override
  List<Bind> get binds => [];

  //Навігаційні путі (Routes)
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => HomePage()),
      ];
}

//Screen 1
class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: Text('This is initial page'),
      ),
    );
  }
}
