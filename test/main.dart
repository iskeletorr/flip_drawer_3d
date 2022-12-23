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
                title: Text('AppBar Text'),
              ),
          mainPage: (context, controller, controller2, controller3) => CustomNormalView(
                child: Column(
                  children: [
                    Container(color: Colors.green, height: 200, child: Center(child: Text('sdsdsds'))),
                    Expanded(
                        child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) => Text(index.toString()),
                    ))
                  ],
                ),
                // pageViewOptions: PageViewOptions(
                //   // separatorBuilder: (p0, p1) => Text(''),
                //   // itemCount: 5,
                //   // itemBuilder: (p0, p1) => Container(width: 200,height: 200,color: Colors.amber,child: Center(child: Text(p1.toString())),),
                //   childrenDelegate: SliverChildBuilderDelegate((context, index) => Container(width: 200,height: 200,color: Colors.amber,child: Center(child: Text(index.toString())),)),
                //   // scrollDirection: Axis.horizontal,
                //   // children: [
                //   //   Container(
                //   //     child: Center(
                //   //       child: Text('Page1'),
                //   //     ),
                //   //     color: Colors.amber,
                //   //     width: MediaQuery.of(context).size.width / 2,
                //   //     height: MediaQuery.of(context).size.height / 2,
                //   //   ),
                //   //   Container(
                //   //     child: Center(
                //   //       child: Text('Page2'),
                //   //     ),
                //   //     color: Colors.amber,
                //   //     width: MediaQuery.of(context).size.width / 2,
                //   //     height: MediaQuery.of(context).size.height / 2,
                //   //   ),
                //   //   Container(
                //   //     child: Center(
                //   //       child: Text('Page3'),
                //   //     ),
                //   //     color: Colors.amber,
                //   //     width: MediaQuery.of(context).size.width / 2,
                //   //     height: MediaQuery.of(context).size.height / 2,
                //   //   ),
                //   // ],
                // ),
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
