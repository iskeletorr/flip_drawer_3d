import 'package:flip_drawer_3d/flip_drawer_3d.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlipDrawer3D(
          appBar: (context, controller, controller2) => CustomAppBar(
                color: Colors.pink,
                horizontalController: controller,
                verticalController: controller2,
                title: const Text('AppBar Text'),
              ),
          mainPage: (context, controller, controller2, controller3) => CustomNormalView(
                child: Column(
                  children: [
                    Container(color: Colors.green, height: 200, child: const Center(child: Text('Text'))),
                    Expanded(
                        child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(index.toString()),
                      ),
                    ))
                  ],
                ),
              ),
          contentPage: (context, controller) => Container(
                color: Colors.pink,
              ),
          drawer: CustomDrawer(
            backgroundColor: Colors.blue,
            child: Column(),
          )),
    );
  }
}
