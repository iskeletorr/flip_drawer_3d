This package provides you 3d flip effect while dragging both horizontally and vertically.

## Installation

1.  Add the latest version of package to your pubspec.yaml 

        dependencies:
          flip_drawer_3d: ^0.0.1

2.  Import the package and use it in your Flutter app

        import 'package:flip_drawer_3d/flip_drawer_3d.dart';
    
## Usage

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: TdPage(
          appBar: (context, controller, controller2) => CustomAppBar(
                color: Colors.transparent,
                animationController: controller,
                animationController2: controller2,
                title: Text('AppBar Text'),
              ),
          mainPage: (context, controller, controller2) => YourMainPage(
                animationController: controller,
                animationController2: controller2,
              ),
          contentPage: (context, controller) => YourContentPage(
                animationController: controller,
              ),
          drawer: CustomDrawer(
            backgroundColor: Colors.blue,
            child: Column(),
          )
        ),
      );
    }

## Example

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Additional information

Don't hesitate to contribute. Any help would be appreciated !
