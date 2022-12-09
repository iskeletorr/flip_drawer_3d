import 'package:flip_drawer_3d/flip_drawer_3d.dart';
import 'package:flip_drawer_3d/src/main_base_page.dart';
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
      home: TdPage(
        appBar: (BuildContext context, AnimationController controller,
            AnimationController controller2) {
          return CustomAppBar(
            animationController: controller,
            animationController2: controller2,
            title: const Text("Test"),
          );
        },
        drawer: const CustomDrawer(
          child: Drawer(),
        ),
        mainPage: (BuildContext context, AnimationController controller,
            AnimationController controller2, ScrollController? controller3) {
          return CustomListView(
            listView: ListView(
              scrollDirection: Axis.horizontal,
              controller: controller3! ,
              children: [
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.deepOrange,
                ),
                Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.indigo,
                ),
                Container(
                  height: 600,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.purple,
                ),
                Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.indigo,
                ),
                Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.orange,
                ),
                Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.indigo,
                ),
                Container(
                  height: 500,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.yellow,
                ),
              ],
            ),
          );
        },
        contentPage: (context, controller) => Container(
          color: Colors.blueGrey,
        ),
      ),
      theme: ThemeData.dark(),
    );
  }
}
